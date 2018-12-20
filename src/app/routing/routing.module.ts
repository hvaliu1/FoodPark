import { NgModule } from '@angular/core';
import { RouterModule, Routes } from "@angular/router";

import { CategoryComponent } from "../category/category.component";
import { CategoryByIdComponent } from '../category-by-id/category-by-id.component';
import { CategoryByNameComponent } from '../category-by-name/category-by-name.component';
import { CookingMethodsComponent } from '../cooking-methods/cooking-methods.component';
import { ProductsComponent } from '../products/products.component';
import { SearchComponent } from '../search/search.component';
import { CategoryService } from '../category/category.service';
const routes: Routes = [
  { 
    path: 'category', 
    component: CategoryComponent 
  },
  { 
    path: 'category/:id', 
    component: CategoryByIdComponent 
  },
  { 
    path: 'categorybyneme/:catname', 
    component: CategoryByNameComponent 
  },
  { 
    path: 'cooking-methods', 
    component: CookingMethodsComponent 
  },
  { 
    path: 'products', 
    component: ProductsComponent 
  },
  { 
    path: 'search', 
    component: SearchComponent 
  },
  { 
    path: '', 
    component: SearchComponent 
  },
  
  // { 
  //   path: '',
  //   redirectTo: '/customers-us',
  //   pathMatch: 'full'
  // },
  // { 
  //   path: '**',
  //   component: PageNotFoundComponent 
  // }
];
@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class RoutingModule { }
