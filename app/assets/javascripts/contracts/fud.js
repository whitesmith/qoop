window.Fud =
  init: ->
    Web3 = require('web3')
    web3 = new Web3()
    web3.setProvider(new web3.providers.HttpProvider("http://moon.pixels.camp:8545"))
    FudContract = web3.eth.contract(abi)
    @fudContractInstance = FudContract.at('0x00776a1d0759cb697111b0132731d058f3e67299')

  buy: (etherValue) ->
    @fudContractInstance.buy()

  sell: (fudValue) ->
    @fudContractInstance.sell(fudValue)
