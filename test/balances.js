const Gaendu = artifacts.require('Gaendu');

contract('Gaendu', function(accounts){
    it('Should put 10 gaendu in first account', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.balances.call(accounts[0]);
        }).then(function(balance){
            assert.equal(balance.valueOf(), 10, '10 Wasn\'t in the first account');
        });  
    });
});