const Gaendu = artifacts.require('Gaendu');

contract('Gaendu', function(accounts){
    it('Test this framework', function(){
        assert(1, 'two', 'Did not work');
    });

    it('Test balance of owner', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.balances.call(accounts[0]);
        }).then(function(balance){
            console.log(balance.valueOf());
            assert(balance.valueOf(), 1000000, 'Invalid initial amount');
        });            
    });
    it('Test owner of contract', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.getOwner.call();
        }).then(function(owner){
            assert.equal(owner, accounts[0], 'Invalid owner');
        }); 
    });
    
    it('Test add of coowner', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.addCoOwner.call(accounts[1], 100);
        }).then(function(result){
            assert.equal(result, true, 'Couldn\'t add coowner');
        }); 
    });

    
    it('Test add of duplicate coowner', function(){
        return Gaendu.deployed().then(function(instance){
            return instance.isCoOwner.call(accounts[1]);
        }).then(function(result){
            assert.equal(result, false, 'Should not add duplicate coowner');
        }); 
    });
});