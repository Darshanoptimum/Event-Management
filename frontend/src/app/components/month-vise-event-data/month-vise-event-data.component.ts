import { Component, ElementRef } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { VieweventGuard } from 'src/app/Guard/viewevent.guard';
import { ApiService } from '../api.service';
import { Monthdata } from '../monthdata';

@Component({
  selector: 'app-month-vise-event-data',
  templateUrl: './month-vise-event-data.component.html',
  styleUrls: ['./month-vise-event-data.component.css']
})
export class MonthViseEventDataComponent {
  constructor(private fb: FormBuilder, private apiService: ApiService, private elementRef: ElementRef, private router: Router, private viewGuard: VieweventGuard) { }
  event !: Monthdata[];
  events = new Monthdata();
  ngOnInit(): void {
    this.events.flag="MonthData";
    this.events.MONTH=this.apiService.selectMonth;
    this.apiService.addPerson(this.events, "api/GetMonthViseEvent")
        .subscribe(
          data => {
            if (data.ArrayOfResponse.length > 0) {
              this.event = data.ArrayOfResponse;
            }
            console.log(this.event)
            // console.log(data.ArrayOfResponse.Startdate)
          },
          error => {
            alert("Error")
            console.log(error);
          });
  }
  btnview1(id: any) {
    this.viewGuard.viewPageFlag = true;
    this.apiService.eventId = id;
    this.router.navigate(["/viewEvent"])
  }
}
