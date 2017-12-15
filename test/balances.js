const Gaendu = artifacts.require('Gaendu');

contract('Gaendu', function(accounts){
    it('Test balance of owner', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.balances.call(accounts[0]);
        }).then(function(balance){
            assert(balance.valueOf(), 10, 'Invalid initial amount');
        });            
    });
    it('Test owner of contract', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.getOwner.call();
        }).then(function(owner){
            assert.equal(owner, accounts[0], 'Invalid owner');
        });
            
    });
});