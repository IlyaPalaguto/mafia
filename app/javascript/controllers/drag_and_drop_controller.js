import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "inputsWrapper",
    "dropZone",
  ];

  connect() {
    this.setupDragAndDrop();
  }


  setupDragAndDrop() {

    this.dropZoneTargets.forEach((dropZone) => {
      dropZone.addEventListener("dragover", (event) => {
        event.preventDefault();
      });

      dropZone.addEventListener("drop", (event) => {
        event.preventDefault();

        const playerId = dropZone.dataset.playerId

        const hiddenInput = this.inputsWrapperTarget.querySelector("input");
        if (hiddenInput.value) {
          const clone = hiddenInput.cloneNode(true)
          clone.value = playerId
          this.inputsWrapperTarget.appendChild(clone)
        } else {
          hiddenInput.value = playerId
        }
      });
    });
  }
}
