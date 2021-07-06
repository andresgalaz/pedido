import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  @Input() grillaOn: boolean;
  @Input() grillaIcon: boolean;
  @Output() grillaOnChange = new EventEmitter<boolean>();

  constructor() {
    this.grillaOn = true;
    this.grillaIcon = true;
  }

  ngOnInit(): void {
  }

  grillaCambio(): void {
    this.grillaOn = !this.grillaOn;
    this.grillaOnChange.emit(this.grillaOn);
  }
}
