import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["word", "meaning", "example", "level", "answer", "progress", "toggleBtn"]
  static values = {
    cards: Array,
    index: Number,
    showingAnswer: Boolean,
  }

  connect() {
    this.indexValue = 0
    this.showingAnswerValue = false
    this.updateCard()
  }

  updateCard() {
    if (!this.hasWordTarget || this.cardsValue.length === 0) {
      return
    }

    const card = this.cardsValue[this.indexValue]
    this.wordTarget.textContent = card.word || ""
    this.meaningTarget.textContent = card.meaning || ""
    this.exampleTarget.textContent = card.example || ""
    this.levelTarget.textContent = card.level || ""
    this.answerTarget.classList.toggle("visible", this.showingAnswerValue)
    this.toggleBtnTarget.textContent = this.showingAnswerValue ? "Hide answer" : "Show answer"
    this.progressTarget.textContent = `Card ${this.indexValue + 1} / ${this.cardsValue.length}`
  }

  toggleAnswer() {
    if (this.cardsValue.length === 0) {
      return
    }

    this.showingAnswerValue = !this.showingAnswerValue
    this.updateCard()
  }

  nextCard() {
    if (this.cardsValue.length === 0) {
      return
    }

    this.indexValue = (this.indexValue + 1) % this.cardsValue.length
    this.showingAnswerValue = false
    this.updateCard()
  }
}
