const Gaendu = artifacts.require('Gaendu');

module.exports = function(deployer) {
    deployer.deploy(Gaendu, [1000000, "GAENDU", "GND"]);
  };