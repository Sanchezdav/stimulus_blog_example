import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['submitButton', 'form', 'commentErrors', 'titleInput']

  connect() {
    console.log('Form connected!')
  }

  disableSubmitButton() {
    this.submitButtonTarget.classList.add('disabled', 'btn-not-allowed')
    this.submitButtonTarget.innerHTML = 'Creating your question...'
  }

  enableSubmitButton() {
    this.submitButtonTarget.classList.remove('disabled', 'btn-not-allowed')
    this.submitButtonTarget.innerHTML = 'Create question'
  }

  onPostError(event) {
    let [data, status, xhr] = event.detail
    this.titleInputTarget.focus()
    this.enableSubmitButton()
    this.commentErrorsTarget.innerHTML = xhr.response
    this.commentErrorsTarget.classList.add('show')
  }
}
