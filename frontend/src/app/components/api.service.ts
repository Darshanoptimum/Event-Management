import { HttpClient } from '@angular/common/http';
import { EnvironmentProviders, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../environments/environment';
 
@Injectable({providedIn:'root'})
export class ApiService {
  public emailString?:String;
  public eventId?:any;
  constructor(private http: HttpClient) {  }
  addPerson(user:any,endPoint:string): Observable<any> {
    const headers = { 'content-type': 'application/json'}  
    const body=JSON.stringify(user);
    return this.http.post(environment.apiUrl+endPoint, body,{'headers':headers})
  }


  public pageNumber = 1;

 
} 