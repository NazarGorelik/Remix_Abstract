/*
1)so we can retrieve neccesary data from event, after the block with our transaction is minted.
just deploy Events_1.sol and call sendTo method. After the block is got minted, we can call the script and 
it will return all transactions, which were minted using our wallet with this function.
2)to listen on the events in realTime we need to use a bit other aproach.
3)https://medium.com/coinmonks/solidity-events-explained-82dc9104bc62
*/

(async () => {
let contractAddress = "0xB270Ab4688da420CD74ed7512B2D41cD76186F54";
let abi = [
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "_from",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "_to",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "_value",
				"type": "uint256"
			}
		],
		"name": "TokensSent",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_value",
				"type": "uint256"
			}
		],
		"name": "sendTo",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "tokenBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

const contract = new web3.eth.Contract(abi, contractAddress);
contract.getPastEvents('TokensSent', {
  filter: { _from: '0xE6654Db73881ff06904FF4D1dCAf578b454d9bA4' }, //we can use many filters
  fromBlock: 0, // Start block number
  toBlock: 'latest' // End block number
})
.then(function(events) {
  // Process the retrieved events
  console.log(events);
})
.catch(function(error) {
  // Handle errors
  console.error(error);
});

//this code is for realtime listening
// contract.events.TokensSent({
//     filter: { _from: '0xE6654Db73881ff06904FF4D1dCAf578b454d9bA4' } // Optional: add filters here
//   })
// .on('data', function(event) {
//   // Handle the received event data
//   console.log(event);
// })
// .on('error', function(error) {
//   // Handle errors
//   console.error(error);
// });
})()