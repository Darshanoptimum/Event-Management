import { Component, ElementRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiService } from '../api.service';
import { Event } from '../event';

@Component({
  selector: 'app-publish-event',
  templateUrl: './publish-event.component.html',
  styleUrls: ['./publish-event.component.css']
})
export class PublishEventComponent {
  myForm!: FormGroup;
  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef){}
  events?:Event[];
  event = new Event();



  ngOnInit(): void {
    this.myForm = this.fb.group({
      EventId: ['', Validators.required]
    });
    // call api for get active event for publish
    this.apiService.addPerson(this.event,"api/getActiveEvent")
      .subscribe(
        data => {
          if(data.ArrayOfResponse.length>0){
            this.events=data.ArrayOfResponse;
          console.log(this.events)
          }
        }, 
        error => {
          console.log(error);
    });
    this.myForm = this.fb.group({
      EventId: ['', Validators.required]
    });
  }
  events1?:Event[];
  event1 = new Event();
  ResponseMessage?:string;
  onSubmit(form: FormGroup) {
    console.log('Valid?', form.valid)
    console.log('EventId', form.value.EventId);
    this.event1.Id=form.value.EventId;
    // call api for publish Event
    if(form.valid){
    this.apiService.addPerson(this.event1,"api/PublishEvent")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseMessage = data;
        // var d1 = this.elementRef.nativeElement.querySelector('#publishMessage');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
      }, 
      error => {
        console.log(error);
      });
    }
    else{
      alert("Select the event")
    }
  }
}
