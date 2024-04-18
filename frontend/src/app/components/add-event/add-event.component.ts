import { Component, ElementRef, Input, OnInit } from '@angular/core';
import { AbstractControl, FormBuilder, FormGroup, NG_VALIDATORS, ValidationErrors, Validator, ValidatorFn, Validators } from '@angular/forms';
import { Event } from '../event';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-add-event',
  templateUrl: './add-event.component.html',
  styleUrls: ['./add-event.component.css'],

})

export class AddEventComponent implements OnInit {
  myForm!: FormGroup;
  Announcementform!: FormGroup;
  imgstring!: string;
  events?: Event[];
  event = new Event();
  ResponseMessage?: string;
  mindate = new Date().toISOString().slice(0, 10);
  
  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef) { }


  ngOnInit() {
    this.myForm = this.fb.group({
      EventName: ['', Validators.required],
      Startdate: ['', [Validators.required]],
      Enddate: ['', [Validators.required]],
      EventImage: ['', [Validators.required]],
    });
  }
  // Admin select the image this event create base64 string of image
  onFileChange(event: any) {
    if (event.target.files[0].type == 'image/jpeg' || event.target.files[0].type == 'image/png' || event.target.files[0].type == 'image/avif') {
      const file = event.target.files[0];
      const reader = new FileReader();
      reader.onloadend = () => {
        const base64String = reader.result as string;
        this.imgstring = base64String;
        console.log(base64String); 
      };
      if (file) {
        reader.readAsDataURL(file);
      }
    }
    else {
      alert("change file type")
      this.myForm.get('EventImage')?.setErrors({})
    }
  }

  onSubmit(form: FormGroup) {
    this.event.EventName = form.value.EventName;
    this.event.EventStartDate = form.value.Startdate;
    this.event.EventEndDate = form.value.Enddate;
    this.event.image = this.imgstring;
    if (form.valid) {
      // call api for add event
      this.apiService.addPerson(this.event, "api/AddEvent")
        .subscribe(
          data => {
            console.log(data);
            this.ResponseMessage = data;
          },
          error => {
            console.log(error);
            alert("Error")
          });
    } else {
      alert("Enter valid values")
    }
  }
}

