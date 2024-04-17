import { Component, ElementRef, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ApiService } from '../api.service';
import { Event } from '../event';
import { Activity } from '../activity';

@Component({
  selector: 'app-add-activity',
  templateUrl: './add-activity.component.html',
  styleUrls: ['./add-activity.component.css']
})
export class AddActivityComponent implements OnInit{

  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef){}
  events?:Event[];
  event = new Event();
  myForm!: FormGroup;

  ngOnInit(): void {
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityName: ['', Validators.required],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]]
    });
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
      EventId: ['', Validators.required],
      ActivityName: ['', [Validators.required]],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]]
    });
  }

  activitys?:Activity[];
  activity = new Activity();
  ResponseMessage?: string;
  onSubmit(form: FormGroup) {
    console.log('Valid?', form.valid); // true or false
    console.log('ActivityName', form.value.ActivityName); // true or false
    console.log('ActivityStartDate', form.value.Startdate); // true or false
    console.log('ActivityEndDate', form.value.Enddate); // true or false
    console.log('EventId', form.value.EventId); // true or false

    this.activity.EventId=form.value.EventId;
    this.activity.ActivityName=form.value.ActivityName;
    this.activity.ActivityStartDate=form.value.Startdate;
    this.activity.ActivityEndDate=form.value.Enddate;
    if(form.valid){
    this.apiService.addPerson(this.activity,"api/addActivity")
    .subscribe(
      data => {
        console.log(data);
        this.ResponseMessage=data;
        // var d1 = this.elementRef.nativeElement.querySelector('#activityMessage');
        // d1.innerHTML="";
        // d1.insertAdjacentHTML('beforeend', '<div class="two"><b>'+data+'</b></div>');
      }, 
      error => {
        console.log(error);
      });
    }else{
      alert("Enter valid values")
    }
    
  }
  minDate!:string;
  maxDate!:string;

  event2 = new Event();

  onEventChange () {
    this.event2.Id=this.myForm.value.EventId;
    this.apiService.addPerson(this.event2,"api/getEventDate")
      .subscribe(
        data => {
          console.log(data)
          // this.minDate=data.ArrayOfResponse[0].EventStartDate.toString().substring(0,10).split('-').reverse().join('-')+"T12:00";
          // this.maxDate=data.ArrayOfResponse[0].EventEndDate.toString().substring(0,10).split('-').reverse().join('-')+"T00:00";
          this.minDate=data.ArrayOfResponse[0].EventStartDate+"T00:00";
          this.maxDate=data.ArrayOfResponse[0].EventEndDate+"T00:00";
          console.log(this.myForm.value.Startdate)
          console.log(this.minDate)
          console.log(this.maxDate)
        }, 
        error => {
          console.log(error);
    });
  }

}
