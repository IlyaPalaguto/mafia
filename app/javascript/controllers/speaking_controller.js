import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["activePlayer", "waitingPlayers"];

  connect() {
    this.waitingPlayersList = Array.from(this.waitingPlayersTarget.children);
  }

  nextPlayer({target}) {
    if (this.waitingPlayersList.length > 0) {
      if (this.waitingPlayersList.length == 1) {
        target.classList.add("hidden");
      }
      const nextPlayerCard = this.waitingPlayersList.shift();

      this.activePlayerTarget.querySelector(".player-avatar span").textContent =
        nextPlayerCard.querySelector(".player-avatar span").textContent;

      this.activePlayerTarget.querySelector(".player-name").textContent =
        nextPlayerCard.querySelector(".player-name").textContent;

      nextPlayerCard.remove();
    }
  }
}
