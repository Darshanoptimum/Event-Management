import { TestBed } from '@angular/core/testing';

import { VieweventGuard } from './viewevent.guard';

describe('VieweventGuard', () => {
  let guard: VieweventGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(VieweventGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
