(async () => {
    const address = "0x8566810e1175D75a89058F17a43389A245AadBbe"
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyuint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];
    let contractInstance = new web3.eth.Contract(abiArray, address);
    console.log(await contractInstance.methods.myUint().call());//call getter

	let accounts = await web3.eth.getAccounts();
	let txResult = await contractInstance.methods.setMyuint(666).send({from: accounts[0]});//call setMyuint function
    console.log(await contractInstance.methods.myUint().call());
	console.log(txResult);
})()