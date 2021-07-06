import { Injectable } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class ApplicationStateService {
  private estadoUI: UIState;

  public isXS: boolean = false;
  public isSM: boolean = false;
  public isMD: boolean = false;
  public isLG: boolean = false;
  public isXL: boolean = false;

  public minXS: boolean = false;
  public minSM: boolean = false;
  public minMD: boolean = false;
  public minLG: boolean = false;
  public minXL: boolean = false;

  private size: number = 0;


  private previousUrl: string;
  private currentUrl: string;

  constructor(private router: Router) {
    this.estadoUI = { tabState: 1, acordionState: 1, grillaOn: false };
    this.refresh()
    this.currentUrl = this.router.url;
    this.previousUrl = '';
    router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.previousUrl = this.currentUrl;
        this.currentUrl = event.url;
      };
    });
  }

  public refresh() {
    this.isXS = false;
    this.isSM = false;
    this.isMD = false;
    this.isLG = false;
    this.isXL = false;
    if (window.innerWidth < 576) this.isXS = true;
    else if (window.innerWidth < 768) this.isSM = true;
    else if (window.innerWidth < 992) this.isMD = true;
    else if (window.innerWidth < 1200) this.isLG = true;
    else if (window.innerWidth >= 1200) this.isXL = true;

    this.minXS = false;
    this.minSM = false;
    this.minMD = false;
    this.minLG = false;
    this.minXL = true;
    if (window.innerWidth < 576) this.minXS = true;
    if (window.innerWidth >= 576) this.minSM = true;
    if (window.innerWidth >= 768) this.minMD = true;
    if (window.innerWidth >= 992) this.minLG = true;
    if (window.innerWidth >= 1200) this.minXL = true;

    this.size = window.innerWidth;
  }

  public getSize(): number {
    return this.size;
  }

  public getEstadoUI(): UIState {
    return this.estadoUI;
  }

  public getPreviousUrl() {
    return this.previousUrl;
  }
}

export interface UIState {
  tabState: number;
  acordionState: number;
  grillaOn: boolean;
}