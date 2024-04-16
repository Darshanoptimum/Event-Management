import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class VieweventGuard implements CanActivate {
  constructor(private router:Router){}

  public viewPageFlag:boolean=false;
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      if (this.viewPageFlag) {
        return true;
     } else {
        this.router.navigate(["/userdashboard"]);
        return false;
     }
  }
  
}
