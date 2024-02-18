module scallop_liquidator::coin_util {

  use sui::coin::{Self, Coin};
  use sui::tx_context::{Self, TxContext};
  use sui::transfer;

  #[lint_allow(self_transfer)]
  public fun destory_or_send_to_sender<T>(
    coin: Coin<T>,
    ctx: &mut TxContext
  ) {
    if (coin::value(&coin) > 0) {
      transfer::public_transfer(coin, tx_context::sender(ctx))
    } else {
      coin::destroy_zero(coin);
    }
  }
}
