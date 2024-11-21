/*
1)web3 object is connected with enviroment in deployment dialog. Hence if we choose metamask as an enviroment, 
then we will get only one wallet. If default remix enviroment is choosen, then it will log 15 wallets.
*/

(async () => {
    console.log("abc");
    let accounts = await web3.eth.getAccounts();
    console.log(accounts, accounts.length);
    let balance = await web3.eth.getBalance(accounts[0]);//balance in wei
    console.log(balance);
    let balanceEth = await web3.utils.fromWei(balance, "ether");//balance in ether
    console.log(balanceEth);
})();