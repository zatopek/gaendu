const Gaendu = artifacts.require('Gaendu');

module.exports = function(deployer) {
    deployer.deploy(Gaendu, 10, "GAENDU", "GND");
  };