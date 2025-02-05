import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["candidateBlock", "checkbox", "nextPlayerButton"];

  connect() {
    this.currentCandidateIndex = 0;
    this.votedPlayerIds = new Set();
    this.showCurrentCandidate();
  }

  showCurrentCandidate() {
    this.candidateBlockTargets.forEach((block, index) => {
      block.classList.toggle("hidden", index !== this.currentCandidateIndex);
    });
  }

  checkVoters({ target }) {
    if (!this.hasNextPlayerButtonTarget) return

    const selectedCheckboxes = target.closest(".form-card")
                                     .querySelectorAll("input:checked").length;

    const remainingCandidates = this.candidateBlockTargets.length - this.votedPlayerIds.size;

    this.nextPlayerButtonTarget.classList.toggle("hidden", selectedCheckboxes === remainingCandidates);
  }

  nextCandidate() {
    this.storeVotedPlayers();
    this.currentCandidateIndex++;
    if (this.currentCandidateIndex < this.candidateBlockTargets.length) {
      this.showCurrentCandidate();
      
      if (this.currentCandidateIndex + 1 === this.candidateBlockTargets.length) { // if it's last
        this.nextPlayerButtonTarget.remove();
      }
    }
  }

  storeVotedPlayers() {
    this.candidateBlockTargets[this.currentCandidateIndex]
      .querySelectorAll("input:checked")
      .forEach((input) => this.votedPlayerIds.add(input.value));

    this.updateHiddenVoters();
  }

  updateHiddenVoters() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.closest(".input-container").classList.toggle("hidden", this.votedPlayerIds.has(checkbox.value));
    });
  }
}
