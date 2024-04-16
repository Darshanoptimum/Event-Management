import { Component, ElementRef, Input } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { VieweventGuard } from 'src/app/Guard/viewevent.guard';
import { ApiService } from '../api.service';
import { Event } from '../event';

@Component({
  selector: 'app-user-event-table',
  templateUrl: './user-event-table.component.html',
  styleUrls: ['./user-event-table.component.css']
})
export class UserEventTableComponent {
  PageNumber=this.apiService.pageNumber;
  @Input() public EventPerPage1?: any;

  events?:Event[];
  event = new Event();
  constructor(private fb: FormBuilder,private apiService: ApiService,private elementRef:ElementRef,private router:Router,private viewGuard:VieweventGuard){}

  btnview(id:any){
    this.viewGuard.viewPageFlag=true;
    this.apiService.eventId=id;
    this.router.navigate(["/viewEvent"])
  }

  ngOnInit(): void {
    let obj = {Page:this.PageNumber,EventPerPage:this.EventPerPage1}
    this.apiService.addPerson(obj,"api/GetEventDataForPage")
      .subscribe(
        data => {
          if(data.ArrayOfResponse.length>0){
            this.event=data.ArrayOfResponse;
            this.events=data.ArrayOfResponse;
          }
          console.log(this.event)
          console.log(data)
        }, 
        error => {
          console.log(error);
    });
  }

}
