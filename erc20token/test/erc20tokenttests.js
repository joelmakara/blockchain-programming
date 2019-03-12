
const erc20token = artifacts.require("erc20token");

contract('erc20tokenttests', function(accounts) {
  it("should assert true", function(done) {
    erc20token.deployed();
    assert.isTrue(true);
    done();
  });

  it("should put 10000000 ERC20 Tokens in the first account", () =>
      erc20token.deployed()
      .then(instance => instance.getBalance.call(accounts[0]))
      .then(balance => {
        assert.equal(
          balance.valueOf(),
          10000000,
          "10000 wasn't in the first account"
        );
      }));
});
