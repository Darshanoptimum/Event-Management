import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserEventTableComponent } from './user-event-table.component';

describe('UserEventTableComponent', () => {
  let component: UserEventTableComponent;
  let fixture: ComponentFixture<UserEventTableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserEventTableComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserEventTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
