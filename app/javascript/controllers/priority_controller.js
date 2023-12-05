import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {
    console.log("Hello it's Salman Ahmad");
  }
  next(event) {
    var taskId = event.params.taskid;
    const priority = document.querySelector(`#task_priority_${taskId}`).value;
    $.ajax({
      url: `/tasks/${taskId}`,
      contentType: 'application/json',
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      method: 'patch',
      data: JSON.stringify({task: {priority: priority}}),
      success: function(response) {
        this.updatePage();
      }.bind(this),
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  }

  updatePage(){
    $.ajax({
      url: `/projects/1`,
      method: 'get',
      success: function(response) {
        const parser = new DOMParser();
        const doc = parser.parseFromString(response, 'text/html');
        const tableBodyContent = doc.querySelector('tbody').innerHTML;
        $("#my-table").html(tableBodyContent);
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  }
}
