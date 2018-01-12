# qoop
Qoop - Qooperative Qooking


# The Idea
*Eating is not about the money, and it shouldn't be.* 

It's about the joy of cooking, gathering around a table and sharing a meal. Its intrinsic value should be on the idea of the meal itself and the social interaction that arises, not really about how much €€€ it costs.

Qoop is the app that makes it all possible, allowing everyone to share meals, getting other meals in return, disregarding monetary transactions and focusing on creating a parallel, _de-centralized Ethereum-based token economy for meal-sharing that holds itself together with the reliability of Smart Contracts._

On top of that, we also try to make the world a slightly better place.

# How it Works
_Qoop makes it easy to share meals with your friends, co-workers and neighbours._

When you're cooking and notice you've made enough for a few extra guests, just fire up the app and create a new shared meal. Every one of your friends using the app will be notified that something _yummy_ is cooking and can join in. Unless all the spots are taken. In that case, better luck next time.

![](https://raw.githubusercontent.com/whitesmith/qoop/master/app/assets/images/description-1.png)

_But sharing isn't just taking. It's also giving back._

To join a meal, guests have to make sure the host gets a bit more than their delightful presence. In Qoop, meals are shared using `FUD`, a decentralized coin living on the Ethereum network. `1 FUD -> 1 Meal`, no exceptions, because memorable dinners are not the expensive ones, but the fun, the romantic, the lively, the bohemian ones.

At the end of the meal, everyone confirms that it was as awesome as expected, and the host gets his `FUD`. Now the cycle can keep going on and on, trading tokens for engaging meals, conversations and memories.

_But where does `FUD` come from?_

Meals can't be given away for free (unfortunately), so to get those first `FUD` tokens to get you started, guests and cooks alike can just fire up the app and trade `ETH` for tokens. The value is symbolic (`0.015 ETH -> 1 FUD`) and gets a lot more done than you're thinking right now. Just keep reading and you'll see.

![](https://raw.githubusercontent.com/whitesmith/qoop/master/app/assets/images/description-2.png)

# Sharing Locally and Globally

In our vision food is fuel, but meals are nurture and a pillar for our intrinsic social nature. With the meal sharing portion of the app, we hope to connect those that have enough to share in meaningful moments.

_However, we are deeply aware that not everyone has enough to eat, much less to share._ So let's take the opportunity given to us by Qoop, and change it.

The opportunity we are presented with is `ETH`, the one that is spent to buy `FUD` tokens. From the pool of `ETH` collected through the app, _the Qoop team pledges to give 50% of the collected `ETH` to charitable foundations that help feed those that can't feed themselves._ In a way, when you're getting your tokens, you are getting meals for yourself, but also for someone that really can't afford it.

![](https://raw.githubusercontent.com/whitesmith/qoop/master/app/assets/images/description-3.png)

What about the other 50%? For us this isn't about the profit, so we reserve that 50% for users that want to exchange their `FUD` back to `ETH` (at half the exchange rate, to account for the donated slice). So if you're a serial cooker, don't worry, you won't be swimming in so much `FUD` you won't breathe.

# Under the Hood

_Now for the nitty-gritty._

### FUD
The `FUD` token is an [ERC20](https://theethereum.wiki/w/index.php/ERC20_Token_Standard) compliant token, living for now in the Pixels Camp Ethereum Testnet. You can find the smart contract living at `0x00776a1d0759cb697111b0132731d058f3e67299`. If you want you can see [the source code for the contract](https://github.com/whitesmith/qoop/tree/master/contracts), as well as its JSON interface so you can call it directly if you want.

Additionally to the ERC20 methods, this contract also specifies the `buy` and `sell`methods to make the `ETH <-> FUD` transactions and a couple of extra functions to deal with creating and managing meals.

This contract is defined so half the received `ETH` is credited to its owner, so the charitable donations can be performed using `ETH` or some fiat currency. In the future we hope to be able to interact with other smart contracts deployed by charities, so we can keep accountability at a maximum.

### Meal Contracts
Shared meals are defined as a [separate contract](https://github.com/whitesmith/qoop/blob/master/contracts/MealContract.sol) that is instantiated every time someone creates a new meal. So every shared meal is a separate contract where cooks and guests can interact to join, approve and close the meal.

While this contract is active, all the `FUD` associated with it is held in escrow by the contract itself. When all participants approve the meal (after it happens), all the `FUD` tokens are transferred to the cook and the contract self destructs.

### Web/Mobile App
The Qoop app is built using Ruby on Rails, for a bare-bones backend where we can store additional information regarding meals. Since all the business logic is done in the smart contract themselves, most of the data stored is cosmetic (pictures, names, descriptions).

Interaction with the smart contracts is done on the client side, using [web3.js](https://github.com/ethereum/web3.js/), with optional interactions with Metamask for transaction signing.

To get it looking pretty for the PC and mobile, we built it over [Bulma](http://bulma.io/) which is pretty awesome according to both our engineers and our designers.

# FAQ

**Q: Can you shed some light on how this idea came to be?**

_A: Basically, a couple of months ago a couple of the idle minds at [Whitesmith](https://www.whitesmith.co/) thought that it would be cool to make an app to help with sharing homemade meals at the office. Like most ideas by idle minds, that never came to be._

_When we got the word that Pixels Camp was gonna revolve around Blockchain, we thought it would be the perfect time to finally get the idea off the ground and get our feet wet on Ethereum and Smart Contracts (yep, first timers in `ETH` here, please be don't be harsh)._

**Q: This is pretty cool, but can I get a TL;DR?**

_A: Well, you basically stop paying for meals with money and start trading it for other meals. In the process you feed hungry people and if everyone starts using it, soon eating a meal will be a completely money-free event._


**Q: Are you really donating anything to charity? What keeps you from hoarding the `ETH` to yourself?**

_A: Right now, no, we are not donating. Mainly because this still lives in the Pixels Camp Testnet and the `ETH` here is worthless. And when we migrate this to the real deal, we are looking at a more accountable approach to donating, like transferring the `ETH` directly to a charity. Ideally, it would go towards some smart contract enforcing humanitarian aid for hunger relief._


**Q: Isn't the meal contract a bit barebones? Shouldn't info on the meal also live on the blockchain?**

_A: Great question, and one we haven't been able to figure out ourselves. Right now we can see that more information on the meal (at least location and short description) should be stored, to prevent tampering with the contract. But we also get that storing too much data on the blockchain is expensive (gas), so we were left wondering. If you're able to help us out here, we'd love to chat._

**Q: This project is awesome and I want to help! Is this going to live past Pixels Camp?**
_A: We certainly hope so, as half of its interest resides on it dealing with real value that can be put to good use. Reach out to us on `#qoop` on the Pixels Camp Slack, on [Github](https://github.com/whitesmith/qoop) or just talk to us directly, this is one of those projects that thrives on community, so come help._
