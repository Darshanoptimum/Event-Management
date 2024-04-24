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
export class AddActivityComponent implements OnInit {

  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef) { }

  events?: Event[];
  event = new Event();
  myForm!: FormGroup;
  activitys?: Activity[];
  activity = new Activity();
  ResponseMessage?: string;
  minDate!: string;
  maxDate!: string;
  event2 = new Event();

  ngOnInit(): void {
    this.myForm = this.fb.group({
      EventId: ['', Validators.required],
      ActivityName: ['', Validators.required],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]]
    });
    
    //call api for get all Non publish Event
    this.apiService.addPerson(this.event, "api/getActiveEvent")
      .subscribe(
        data => {
          if (data.ArrayOfResponse.length > 0) {
            this.events = data.ArrayOfResponse;
            // console.log(this.events)
          }
        },
        error => {
          alert("error");
          console.log(error);
        });
  }

  onSubmit(form: FormGroup) {
    this.activity.EventId = form.value.EventId;
    this.activity.ActivityName = form.value.ActivityName;
    this.activity.ActivityStartDate = form.value.Startdate;
    this.activity.ActivityEndDate = form.value.Enddate;
    console.log(form.value.Startdate);
    if (form.valid) {
      // call api for add activity
      this.apiService.addPerson(this.activity, "api/addActivity")
        .subscribe(
          data => {
            console.log(data);
            this.ResponseMessage = data;
          },
          error => {
            console.log(error);
            alert("error");
          });
    } else {
      alert("Enter valid values")
    }
  }

  onEventChange() {
    this.event2.Id = this.myForm.value.EventId;
    // call api for get selected event start and end date for datepicker
    this.apiService.addPerson(this.event2, "api/getEventDate")
      .subscribe(
        data => {
          console.log(data)
          this.minDate = data.ArrayOfResponse[0].EventStartDate + "T00:00";
          this.maxDate = data.ArrayOfResponse[0].EventEndDate + "T00:00";
          console.log(this.myForm.value.Startdate)
          console.log(this.minDate)
          console.log(this.maxDate)
        },
        error => {
          alert("error")
          console.log(error);
        });
  }
}
