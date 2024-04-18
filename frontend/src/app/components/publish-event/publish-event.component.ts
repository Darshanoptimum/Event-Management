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

  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef){}
  
  myForm!: FormGroup;
  events?:Event[];
  event = new Event();
  events1?:Event[];
  event1 = new Event();
  ResponseMessage?:string;


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
          alert("Error")
          console.log(error);
    });
    this.myForm = this.fb.group({
      EventId: ['', Validators.required]
    });
  }

  onSubmit(form: FormGroup) {
    console.log('Valid?', form.valid)
    console.log('EventId', form.value.EventId);
    this.event1.Id=form.value.EventId;
    // call api for publish Event
    if(form.valid){
    this.apiService.addPerson(this.event1,"api/PublishEvent")
    .subscribe(
      data => {
        // console.log(data);
        this.ResponseMessage = data;
      }, 
      error => {
        alert("Error")
        alert(error);
      });
    }
    else{
      alert("Select the event")
    }
  }
}
