import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from '../api.service';
import { AdminGuard } from 'src/app/Guard/admin.guard';
import { UserGuard } from 'src/app/Guard/user.guard';


@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})
export class NavComponent {
  @Input() public isUserLoggedIn?: boolean;
  
  constructor(private apiService: ApiService,private router:Router,private adminGuard:AdminGuard,private userGuard:UserGuard) { }
  
  logout(){
    this.adminGuard.Adminlogin=false;
    this.userGuard.Userlogin=false;
  }
}
