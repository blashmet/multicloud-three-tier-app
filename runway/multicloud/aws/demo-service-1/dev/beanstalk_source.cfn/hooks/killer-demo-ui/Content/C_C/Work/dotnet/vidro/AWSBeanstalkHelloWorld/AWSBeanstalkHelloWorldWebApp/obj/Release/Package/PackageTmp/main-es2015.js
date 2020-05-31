(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./$$_lazy_route_resource lazy recursive":
/*!******************************************************!*\
  !*** ./$$_lazy_route_resource lazy namespace object ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html":
/*!**************************************************************************!*\
  !*** ./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html ***!
  \**************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = ("<!-- Load the latest version -->\r\n\r\n\r\n<div class=\"main-container\">\r\n  <div class=\"alert alert-app-level\">\r\n  </div>\r\n  <header class=\"header header-6\">\r\n    <div class=\"branding\">\r\n      <a href=\"...\" class=\"nav-link\">\r\n        <clr-icon shape=\"cloud\"></clr-icon>\r\n        <span class=\"title\">Killer Demo</span>\r\n      </a>\r\n    </div>\r\n    <div class=\"header-nav\">\r\n      <a href=\"javascript://\" class=\"active nav-link nav-text\">Employee Onboarding Task Management</a>\r\n    </div>\r\n    <div class=\"header-actions\">\r\n      <a href=\"javascript://\" class=\"nav-link nav-icon-text\" aria-label=\"Redis Browser\">\r\n        <clr-icon shape=\"cog\"></clr-icon>\r\n        <span class=\"nav-text\">Version: {{ this.env.version }}</span>\r\n      </a>\r\n\r\n    </div>\r\n  </header>\r\n\r\n  <div class=\"content-container\">\r\n    <div class=\"content-area\">\r\n      <div class=\"clr-row\">\r\n        <div class=\"clr-col-lg-7 clr-col-md-12 clr-col-12\">\r\n          <div class=\"card\">\r\n            <div class=\"card-header\">\r\n              New Employees\r\n            </div>\r\n            <div class=\"card-block\">\r\n              <div class=\"card-text\">\r\n                <clr-datagrid>\r\n                  <clr-dg-column>\r\n                    Name\r\n                    <clr-dg-string-filter [clrDgStringFilter]=\"empNameFilter\"></clr-dg-string-filter>\r\n                  </clr-dg-column>\r\n                  <clr-dg-column></clr-dg-column>\r\n                  <clr-dg-column>Address</clr-dg-column>\r\n                  <clr-dg-column>State</clr-dg-column>\r\n                  <clr-dg-column>Email</clr-dg-column>\r\n                  <clr-dg-column></clr-dg-column>\r\n\r\n                  <clr-dg-row *ngFor=\"let x of AddressItems | async | slice:0:5; let i=index\">\r\n                    <clr-dg-cell class=\"left\">{{x.firstname +\" \"+x.lastname}}</clr-dg-cell>\r\n                    <clr-dg-cell><img src=\"{{x.profilepicture}}\" class=\"inline-profile-pic\" /></clr-dg-cell>\r\n                    <clr-dg-cell>{{x.streetaddress}}</clr-dg-cell>\r\n                    <clr-dg-cell>{{x.state}}</clr-dg-cell>\r\n                    <clr-dg-cell>{{x.email}}</clr-dg-cell>\r\n                    <clr-dg-cell><a class=\"btn btn-link btn-sm\" (click)=\"editAddress(x);quickAddAddress = true\">Edit</a></clr-dg-cell>\r\n\r\n                  </clr-dg-row>\r\n                  <clr-dg-footer>{{(AddressItems | async)?.length}} total employees</clr-dg-footer>\r\n                </clr-datagrid>\r\n              </div>\r\n\r\n            </div>\r\n            <div class=\"card-footer\">\r\n              <button class=\"btn btn-sm btn-link\" (click)=\"quickAddAddress = true\">Quick Add</button>\r\n              <button class=\"btn btn-sm btn-link\" (click)=\"fullListAddress = true\">View All Items</button>\r\n            </div>\r\n          </div>\r\n\r\n        </div>\r\n        <div class=\"clr-col-lg-5 clr-col-md-12 clr-col-12\">\r\n          <div class=\"card\">\r\n            <div class=\"card-header\">\r\n              Employee Onboarding Tasks\r\n            </div>\r\n            <div class=\"card-block\">\r\n              <div class=\"card-text\">\r\n                <clr-datagrid>\r\n                  <clr-dg-column>Task</clr-dg-column>\r\n                  <clr-dg-column>\r\n                    Employee\r\n                    <clr-dg-string-filter [clrDgStringFilter]=\"nameFilter\"></clr-dg-string-filter>\r\n                  </clr-dg-column>\r\n                  <clr-dg-column>Due date</clr-dg-column>\r\n                  <clr-dg-column>\r\n                    Assigned To\r\n                    <clr-dg-string-filter [clrDgStringFilter]=\"createdByFilter\"></clr-dg-string-filter>\r\n                  </clr-dg-column>\r\n                  <clr-dg-column></clr-dg-column>\r\n\r\n                  <clr-dg-row *ngFor=\"let x of todoItems | async | slice:0:5; let i=index\">\r\n                    <clr-dg-cell class=\"left\">{{x.todoText}}</clr-dg-cell>\r\n                    <clr-dg-cell>{{x.employeeName}}</clr-dg-cell>\r\n                    <clr-dg-cell>{{x.dueDate | date: 'mediumDate'}}</clr-dg-cell>\r\n                    <clr-dg-cell>{{x.createdBy}}</clr-dg-cell>\r\n                    <clr-dg-cell><a class=\"btn btn-link btn-sm\" (click)=\"editTodo(x);quickAddTodo = true\">Edit</a></clr-dg-cell>\r\n                  </clr-dg-row>\r\n\r\n                  <clr-dg-footer>{{(todoItems | async)?.length}} total tasks</clr-dg-footer>\r\n                </clr-datagrid>\r\n\r\n              </div>\r\n\r\n            </div>\r\n            <div class=\"card-footer\">\r\n              <button class=\"btn btn-sm btn-link\" (click)=\"quickAddTodo = true\">Quick Add</button>\r\n              <button class=\"btn btn-sm btn-link\" (click)=\"fullListTodo = true\">View All Items</button>\r\n            </div>\r\n          </div>\r\n\r\n        </div>\r\n        \r\n      </div>\r\n\r\n      <div class=\"clr-row\" style=\"visibility: hidden\">\r\n          <div class=\"clr-col-lg-12 clr-col-md-12 clr-col-12\">\r\n            <div class=\"card\">\r\n              <div class=\"card-header\">\r\n                Tasks Being Completed\r\n              </div>\r\n              <div class=\"card-block\">\r\n\r\n                <div class=\"card-text\">\r\n                  <table class=\"table table-compact \" *ngIf='signalRService.data'>\r\n                    <thead>\r\n                      <tr>\r\n                        <th class=\"left\">Client</th>\r\n                        <th>Task</th>\r\n                      </tr>\r\n                    </thead>\r\n                    <tbody>\r\n                      <tr *ngFor=\"let x of signalRService.data\">\r\n                        <td class=\"left\">{{ x.name }}</td>\r\n                        <td >{{ x.value }}</td>\r\n                      </tr>\r\n                    </tbody>\r\n                  </table>\r\n\r\n                </div>\r\n\r\n              </div>\r\n              <div class=\"card-footer\">\r\n                <button class=\"btn btn-sm btn-link\"></button>\r\n              </div>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n        <div class=\"clr-row\">\r\n          <button class=\"btn btn-sm btn-link\" (click)=\"technicalInformation = true\">Technical Information</button>\r\n        </div>\r\n      </div>\r\n    </div>\r\n\r\n<form [formGroup]=\"todoForm\">\r\n  <clr-modal [(clrModalOpen)]=\"quickAddTodo\" [clrModalSize]=\"'lg'\">\r\n\r\n    <h3 class=\"modal-title\">Quick Add Onboarding Task</h3>\r\n    <div class=\"modal-body\">\r\n\r\n      <clr-input-container>\r\n        <label>Onboarding Task:</label>\r\n        <input type=\"text\" clrInput placeholder=\"Onboardning Task\" formControlName=\"todoText\">\r\n      </clr-input-container>\r\n      <clr-select-container>\r\n        <label>Employee Name:</label>\r\n        <select clrSelect formControlName=\"employeeId\" (change)=\"onChange($event)\">\r\n          <option value=\"\" disabled>Choose Employee</option>\r\n          <option *ngFor=\"let x of AddressItems | async\" [ngValue]=\"x.id\">{{x.firstname +\" \"+x.lastname}}</option>\r\n        </select>\r\n      </clr-select-container>\r\n      <clr-date-container>\r\n        <label>\r\n          Due Date:\r\n        </label>\r\n        <input type=\"date\" clrDate name=\"dueDate\"placeholder=\"Due Date\"  formControlName=\"dueDate\">\r\n      </clr-date-container>\r\n      <clr-input-container>\r\n        <label>\r\n          Assigned To:\r\n        </label>\r\n        <input type=\"text\" clrInput formControlName=\"createdBy\" placeholder=\"Assigned To\" >\r\n      </clr-input-container>\r\n      <clr-input-container>\r\n        <input type=\"text\" clr-hidden formControlName=\"id\">\r\n        <input type=\"text\" clr-hidden formControlName=\"employeeName\">\r\n        <input type=\"text\" clr-hidden formControlName=\"createdDate\">\r\n      </clr-input-container>\r\n    </div>\r\n    <div class=\"modal-footer\">\r\n      <button type=\"button\" class=\"btn btn-outline\" (click)=\"quickAddTodo = false\">Cancel</button>\r\n      <button type=\"submit\" class=\"btn btn-primary\" (click)=\"onTodoSubmit();quickAddTodo = false\" [disabled]=\"!todoForm.valid\">Save</button>\r\n    </div>\r\n  </clr-modal>\r\n</form>\r\n\r\n<form [formGroup]=\"addressForm\">\r\n  <clr-modal [(clrModalOpen)]=\"quickAddAddress\" [clrModalSize]=\"'lg'\">\r\n\r\n    <h3 class=\"modal-title\">Quick Add Employee</h3>\r\n    <div class=\"modal-body\">\r\n      <div class=\"clr-row\">\r\n        <div class=\"clr-col-3\">\r\n          <div class=\"clr-row\">\r\n            <div class=\"clr-col-12\">\r\n              <img [src]=\"ppData\" class=\"clr-col-12\" />\r\n              <div class=\"clr-file-wrapper clr-col-12\">\r\n                <label for=\"basic\" class=\"clr-control-label\"><span class=\"btn btn-sm\">browse</span></label>\r\n                <input type=\"file\" id=\"basic\" placeholder=\"Enter value here\" class=\"clr-file\" (change)=\"uploadFile($event)\">\r\n              </div>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"clr-col-9\">\r\n          <div class=\"clr-row\">\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>First Name:</label>\r\n                <input type=\"text\" clrInput formControlName=\"firstname\">\r\n              </clr-input-container>\r\n            </div>\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  Last Name:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"lastname\">\r\n              </clr-input-container>\r\n            </div>\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  Email:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"email\">\r\n              </clr-input-container>\r\n            </div>\r\n          </div>\r\n          <div class=\"clr-row\">\r\n            <div class=\"clr-col-8\">\r\n              <clr-input-container>\r\n                <label>\r\n                  Street Address:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"streetaddress\">\r\n              </clr-input-container>\r\n            </div>\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  City:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"city\">\r\n              </clr-input-container>\r\n            </div>\r\n          </div>\r\n          <div class=\"clr-row\">\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  State:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"state\">\r\n              </clr-input-container>\r\n            </div>\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  Zip:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"zip\">\r\n              </clr-input-container>\r\n            </div>\r\n            <div class=\"clr-col-4\">\r\n              <clr-input-container>\r\n                <label>\r\n                  Phone:\r\n                </label>\r\n                <input type=\"text\" clrInput formControlName=\"phone\">\r\n              </clr-input-container>\r\n            </div>\r\n          </div>                    \r\n          <clr-input-container>\r\n            <input type=\"text\" clr-hidden formControlName=\"id\">\r\n            <input type=\"text\" clr-hidden formControlName=\"createdon\">\r\n            <input type=\"text\" clr-hidden formControlName=\"profilepicture\">\r\n          </clr-input-container>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class=\"modal-footer\">\r\n      <button type=\"button\" class=\"btn btn-outline\" (click)=\"quickAddAddress = false\">Cancel</button>\r\n      <button type=\"submit\" class=\"btn btn-primary\" (click)=\"onAddressSubmit();quickAddAddress = false\">Save</button>\r\n    </div>\r\n  </clr-modal>\r\n</form>\r\n\r\n<clr-modal [(clrModalOpen)]=\"fullListTodo\" [clrModalSize]=\"'xl'\">\r\n  <h3 class=\"modal-title\">All Employee Onboarding Tasks</h3>\r\n  <div class=\"modal-body\">\r\n    <table class=\"table\">\r\n      <thead>\r\n        <tr>\r\n          <th class=\"left\">Task</th>\r\n          <th>Employee</th>\r\n          <th>Assigned To </th>\r\n          <th>Created Date</th>\r\n          <th>Due</th>\r\n          <th></th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr *ngFor=\"let x of todoItems | async\">\r\n          <td class=\"left\">{{ x.todoText }}</td>\r\n          <td class=\"left\">{{ x.employeeName}}</td>\r\n          <td>{{ x.createdBy }}</td>\r\n          <td>{{ x.createdDate | date: 'mediumDate'}}</td>\r\n          <td>{{ x.dueDate | date: 'mediumDate'}}</td>\r\n          <td>\r\n            <a class=\"btn btn-link btn-sm\" (click)=\"removeTodo(x)\">Delete</a>\r\n            <a class=\"btn btn-link btn-sm\" (click)=\"editTodo(x);fullListTodo = false;quickAddTodo = true\">Edit</a>\r\n          </td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n  <div class=\"modal-footer\">\r\n    <button type=\"button\" class=\"btn btn-primary\" (click)=\"fullListTodo = false\">Close</button>\r\n  </div>\r\n</clr-modal>\r\n\r\n<clr-modal [(clrModalOpen)]=\"fullListAddress\" [clrModalSize]=\"'xl'\">\r\n  <h3 class=\"modal-title\">All Employees</h3>\r\n  <div class=\"modal-body\">\r\n    <table class=\"table\">\r\n      <thead>\r\n        <tr>\r\n          <th class=\"left\">Name</th>\r\n          <th class=\"left\"></th>\r\n          <th>Street Address</th>\r\n          <th>City</th>\r\n          <th>State</th>\r\n          <th>Zip</th>\r\n          <th>Phone</th>\r\n          <th>Email</th>\r\n          <th>Created</th>\r\n          <th></th>\r\n        </tr>\r\n      </thead>\r\n      <tbody>\r\n        <tr *ngFor=\"let x of AddressItems | async\">\r\n          <td class=\"left\">{{ x.firstname + \" \"+x.lastname }}</td>\r\n          <td><img src=\"{{ x.profilepicture }}\" class=\"inline-profile-pic\"/></td>\r\n          <td>{{ x.streetaddress }}</td>\r\n          <td>{{ x.city}}</td>\r\n          <td>{{ x.state}}</td>\r\n          <td>{{ x.zip}}</td>\r\n          <td>{{ x.phone}}</td>\r\n          <td>{{ x.email}}</td>\r\n          <td>{{ (x.createdon  + ' UTC') | date: 'MM/dd/yy hh:mm a'}}</td>\r\n          <td>\r\n            <a class=\"btn btn-link btn-sm\" (click)=\"removePerson(x)\">Delete</a>\r\n            <a class=\"btn btn-link btn-sm\" (click)=\"editAddress(x);fullListAddress = false;quickAddAddress = true\">Edit</a>\r\n          </td>\r\n        </tr>\r\n      </tbody>\r\n    </table>\r\n  </div>\r\n  <div class=\"modal-footer\">\r\n    <button type=\"button\" class=\"btn btn-primary\" (click)=\"fullListAddress = false\">Close</button>\r\n  </div>\r\n</clr-modal>\r\n\r\n<clr-modal [(clrModalOpen)]=\"technicalInformation\" [clrModalSize]=\"'xl'\">\r\n  <h3 class=\"modal-title\">Technical Information</h3>\r\n\r\n  <div class=\"modal-body\">\r\n    <div class=\"clr-row\">\r\n      <div class=\"clr-col-lg-12 clr-col-md-12 clr-col-12\">\r\n        <h4>Current Deployment Timeline</h4>\r\n        <img src=\"https://dev.azure.com/KillerDemo/KillerDemo/_apis/build/status/KillerDemo?branchName=master\" />\r\n\r\n        <div *ngIf=\"!buildRunning\">No builds running currently.</div>\r\n        <div *ngIf=\"buildRunning\">Currently running build timeline.</div>\r\n        <div *ngIf=\"!buildRunning && lastBuiltID!=0\">Last build timeline.</div>\r\n        <ul class=\"clr-timeline clr-timeline-horizontal\">\r\n          <li *ngFor=\"let x of ptl | async\" class=\"clr-timeline-step\">\r\n            <div class=\"clr-timeline-step-header\">{{ x.starttime }}</div>\r\n            <!-- need to use the anguler stuff here-->\r\n            <clr-spinner *ngIf=\"x.current\" clrMedium aria-label=\"In progress\">Fetching data</clr-spinner>\r\n            <clr-icon *ngIf=\"!x.current\" [attr.shape]=\"x.labelType\" [attr.aria-current]=\"x.labelText\" [attr.aria-label]=\"x.labelText\"></clr-icon>\r\n            <div class=\"clr-timeline-step-body\">\r\n              <span class=\"clr-timeline-step-title\">{{ x.title }}</span>\r\n              <span class=\"clr-timeline-step-description\">{{ x.desc }}</span>\r\n            </div>\r\n            <!-- Only display this if the last step is complete\r\n        <button class=\"btn btn-sm\" onclick=\"location.reload(true)\" >Action</button>-->\r\n          </li>\r\n        </ul>\r\n      </div>\r\n\r\n        <div class=\"clr-row\">\r\n          <div class=\"clr-col-lg-12 clr-col-md-12 clr-col-12\">\r\n            <div class=\"card\">\r\n              <div class=\"card-header\">\r\n                New Employee Hosting\r\n              </div>\r\n              <div class=\"card-block\">\r\n                <div class=\"card-text\">\r\n                  <div class=\"card-block\">\r\n                    <ul class=\"list p7\">\r\n                      <li>Web.UI Host: {{ this.href  }} - node.Js Linux</li>\r\n                      <li>Web.UI Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>Web.API Host: {{ this.env.urlPerson }} - .net Core 2.2 Linux</li>\r\n                      <li>Web.API Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>DB Type: Postgres</li>\r\n                      <li>DB Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>DB Host: <span>killerdemo_AddressBook</span> </li>\r\n                      <li>DB Client Name: <span>PostgresSQL</span> </li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n          <div class=\"clr-col-lg-12 clr-col-md-12 clr-col-12\">\r\n            <div class=\"card\">\r\n              <div class=\"card-header\">\r\n                Employee Onboarding Tasks Hosting\r\n              </div>\r\n              <div class=\"card-block\">\r\n                <div class=\"card-text\">\r\n                  <div class=\"card-block\">\r\n                    <ul class=\"list p7\">\r\n                      <li>Web.UI Host: {{ this.href  }} - node.Js Linux</li>\r\n                      <li>Web.UI Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>Web.API Host: {{ this.env.urlToDo }} - .net Core 2.2 Linux</li>\r\n                      <li>Web.API Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>DB Type: Redis</li>\r\n                      <li>DB Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>DB Host: <span *ngIf=\"(this.redisInfo | async) as ri; else loading\">{{ ri.url }}</span> </li>\r\n                      <li>DB Client Name: <span *ngIf=\"(this.redisInfo | async) as ri; else loading\">{{ ri.clientName }}</span> </li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"clr-col-lg-12 clr-col-md-12 clr-col-12\">\r\n            <div class=\"card\">\r\n              <div class=\"card-header\">\r\n                Real Time Task Hosting\r\n              </div>\r\n              <div class=\"card-block\">\r\n                <div class=\"card-text\">\r\n                  <div class=\"card-block\">\r\n                    <ul class=\"list p7\">\r\n                      <li>Web.API Host: {{ this.env.urlToDo }} - .net Core 2.2 Linux</li>\r\n                      <li>Web.API Deploy: {{ this.env.deployLocation }}</li>\r\n                      <li>Pub/Sub Message Host: Kafka</li>\r\n                      <li>Pub/Sub Type: Kafka</li>\r\n                      <li>Pub/Sub Location: On Prem - PKS</li>\r\n                    </ul>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n            </div>\r\n          </div>\r\n\r\n        </div>\r\n\r\n    </div>\r\n  </div>\r\n</clr-modal>\r\n\r\n  <router-outlet></router-outlet>\r\n");

/***/ }),

/***/ "./node_modules/tslib/tslib.es6.js":
/*!*****************************************!*\
  !*** ./node_modules/tslib/tslib.es6.js ***!
  \*****************************************/
/*! exports provided: __extends, __assign, __rest, __decorate, __param, __metadata, __awaiter, __generator, __exportStar, __values, __read, __spread, __spreadArrays, __await, __asyncGenerator, __asyncDelegator, __asyncValues, __makeTemplateObject, __importStar, __importDefault */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__extends", function() { return __extends; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__assign", function() { return __assign; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__rest", function() { return __rest; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__decorate", function() { return __decorate; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__param", function() { return __param; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__metadata", function() { return __metadata; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__awaiter", function() { return __awaiter; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__generator", function() { return __generator; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__exportStar", function() { return __exportStar; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__values", function() { return __values; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__read", function() { return __read; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__spread", function() { return __spread; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__spreadArrays", function() { return __spreadArrays; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__await", function() { return __await; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__asyncGenerator", function() { return __asyncGenerator; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__asyncDelegator", function() { return __asyncDelegator; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__asyncValues", function() { return __asyncValues; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__makeTemplateObject", function() { return __makeTemplateObject; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__importStar", function() { return __importStar; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "__importDefault", function() { return __importDefault; });
/*! *****************************************************************************
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at http://www.apache.org/licenses/LICENSE-2.0

THIS CODE IS PROVIDED ON AN *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
MERCHANTABLITY OR NON-INFRINGEMENT.

See the Apache Version 2.0 License for specific language governing permissions
and limitations under the License.
***************************************************************************** */
/* global Reflect, Promise */

var extendStatics = function(d, b) {
    extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return extendStatics(d, b);
};

function __extends(d, b) {
    extendStatics(d, b);
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}

var __assign = function() {
    __assign = Object.assign || function __assign(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
        }
        return t;
    }
    return __assign.apply(this, arguments);
}

function __rest(s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
}

function __decorate(decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
}

function __param(paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
}

function __metadata(metadataKey, metadataValue) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(metadataKey, metadataValue);
}

function __awaiter(thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
}

function __generator(thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
}

function __exportStar(m, exports) {
    for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
}

function __values(o) {
    var m = typeof Symbol === "function" && o[Symbol.iterator], i = 0;
    if (m) return m.call(o);
    return {
        next: function () {
            if (o && i >= o.length) o = void 0;
            return { value: o && o[i++], done: !o };
        }
    };
}

function __read(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
        while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    }
    catch (error) { e = { error: error }; }
    finally {
        try {
            if (r && !r.done && (m = i["return"])) m.call(i);
        }
        finally { if (e) throw e.error; }
    }
    return ar;
}

function __spread() {
    for (var ar = [], i = 0; i < arguments.length; i++)
        ar = ar.concat(__read(arguments[i]));
    return ar;
}

function __spreadArrays() {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};

function __await(v) {
    return this instanceof __await ? (this.v = v, this) : new __await(v);
}

function __asyncGenerator(thisArg, _arguments, generator) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var g = generator.apply(thisArg, _arguments || []), i, q = [];
    return i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i;
    function verb(n) { if (g[n]) i[n] = function (v) { return new Promise(function (a, b) { q.push([n, v, a, b]) > 1 || resume(n, v); }); }; }
    function resume(n, v) { try { step(g[n](v)); } catch (e) { settle(q[0][3], e); } }
    function step(r) { r.value instanceof __await ? Promise.resolve(r.value.v).then(fulfill, reject) : settle(q[0][2], r); }
    function fulfill(value) { resume("next", value); }
    function reject(value) { resume("throw", value); }
    function settle(f, v) { if (f(v), q.shift(), q.length) resume(q[0][0], q[0][1]); }
}

function __asyncDelegator(o) {
    var i, p;
    return i = {}, verb("next"), verb("throw", function (e) { throw e; }), verb("return"), i[Symbol.iterator] = function () { return this; }, i;
    function verb(n, f) { i[n] = o[n] ? function (v) { return (p = !p) ? { value: __await(o[n](v)), done: n === "return" } : f ? f(v) : v; } : f; }
}

function __asyncValues(o) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var m = o[Symbol.asyncIterator], i;
    return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i);
    function verb(n) { i[n] = o[n] && function (v) { return new Promise(function (resolve, reject) { v = o[n](v), settle(resolve, reject, v.done, v.value); }); }; }
    function settle(resolve, reject, d, v) { Promise.resolve(v).then(function(v) { resolve({ value: v, done: d }); }, reject); }
}

function __makeTemplateObject(cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};

function __importStar(mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result.default = mod;
    return result;
}

function __importDefault(mod) {
    return (mod && mod.__esModule) ? mod : { default: mod };
}


/***/ }),

/***/ "./src/Shared/Services/data.service.ts":
/*!*********************************************!*\
  !*** ./src/Shared/Services/data.service.ts ***!
  \*********************************************/
/*! exports provided: DataService, SignalRService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "DataService", function() { return DataService; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SignalRService", function() { return SignalRService; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm2015/http.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../environments/environment */ "./src/environments/environment.ts");
/* harmony import */ var _microsoft_signalr__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @microsoft/signalr */ "./node_modules/@microsoft/signalr/dist/esm/index.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");



//import { DadJoke } from '../../app/models/dadjoke';



let DataService = class DataService {
    constructor(httpClient) {
        this.httpClient = httpClient;
        this.baseToDoUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].urlToDo;
        this.baseDadUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].urlDadJoke;
        this.basePersonUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].urlPerson;
        this.baseDevOpsUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].urlDevOps;
        this.httpOptions = {
            headers: new _angular_common_http__WEBPACK_IMPORTED_MODULE_2__["HttpHeaders"]({
                'Content-Type': 'application/json',
                //'Authorization': 'Basic OmF0Mmp4amVnZno2cHZjNTJtc2xoemxuN3lzbm9yY2xhbndkbHB6dW1pZm1lc241dG9idGE='
                'Authorization': _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].azPAT
            })
        };
    }
    display_Json() {
        this.ptld = this.get_BuildDefinition(2).pipe();
        this.ptld.subscribe((data) => console.log(JSON.stringify(data)));
    }
    get_pizzatrackertimeline(myData) {
        const myttlArr = Array.of(myData.value);
        const map = new Map();
        map.set(3, "Initialize Job, Gathering Job Information.");
        map.set(4, "Checkout, Downloading the code.");
        map.set(5, "Build Images, Compiling code and building images.");
        map.set(6, "Push Images, Pushing images to ACR.");
        map.set(7, "Clean Up, Cleaning up the resources.");
        map.set(8, "Finalize Job, Job finished and finalized.");
        this.arr = [];
        for (let pttl of myttlArr[0]) {
            if (pttl.id > 2 && pttl.id < 9) {
                this.tempLogs = this.get_DetailedLogs(pttl.url.substring(pttl.url.indexOf('builds/') + 7)).pipe();
                this.tempLogs.subscribe((data) => this.logLine = data);
                let abc = {
                    startTime: pttl.createdOn,
                    endTime: pttl.lastChangedOn,
                    labelType: "success-standard",
                    labelText: "Text for " + pttl.id,
                    //title: "Number " + pttl.id,
                    title: map.get(pttl.id).split(',')[0],
                    //desc: "This is number " + pttl.id,
                    desc: map.get(pttl.id).split(',')[1],
                    current: ((pttl.id - 1) != myttlArr[0].length || pttl.id == (myttlArr[0].length - 3)) ? false : true,
                    disabled: "",
                    id: pttl.id
                };
                this.arr.push(abc);
            }
        }
        const arrSource = Array.of(this.arr);
        return Object(rxjs__WEBPACK_IMPORTED_MODULE_5__["from"])(arrSource);
    }
    get_DetailedLogs(logIDs) {
        var url = this.baseDevOpsUrl + 'builds/' + logIDs + '?api-version=5.1';
        return this.httpClient.get(url, this.httpOptions);
    }
    get_BuildDefinition(id) {
        var url = this.baseDevOpsUrl + 'definitions/' + id + '?api-version=5.1';
        return this.httpClient.get(url, this.httpOptions);
    }
    get_RunningBuild(defid) {
        var url = this.baseDevOpsUrl + 'builds?api-version=5.1&definitions=' + defid + '&statusFilter=inProgress';
        return this.httpClient.get(url, this.httpOptions);
    }
    get_LastRunBuild(defid) {
        var url = this.baseDevOpsUrl + 'builds?api-version=5.1&definitions=' + defid;
        return this.httpClient.get(url, this.httpOptions);
    }
    get_BuildLogs(buildid) {
        var url = this.baseDevOpsUrl + 'builds/' + buildid + '/logs?api-version=5.1';
        return this.httpClient.get(url, this.httpOptions);
    }
    get_Todos() {
        var url = this.baseToDoUrl + 'api/todo/';
        //console.log(url);
        return this.httpClient.get(url);
    }
    get_CreateNewEmployeeTodos(id, name) {
        var url = this.baseToDoUrl + 'api/todo/CreateNewEmployeeTasks?id=' + id + '&name=' + encodeURI(name);
        console.log(url);
        this.httpClient.get(url).subscribe();
        return this.get_Todos();
    }
    get_RedisInformation() {
        var url = this.baseToDoUrl + 'api/RedisInfo/';
        return this.httpClient.get(url);
    }
    delete_Todos(id) {
        var url = this.baseToDoUrl + 'api/todo/' + id;
        //console.log(url);
        this.httpClient.delete(url).subscribe();
        return true;
    }
    put_Todos(todo) {
        //console.log(todo);
        var url = this.baseToDoUrl + 'api/todo/' + todo.id;
        //console.log(url);
        this.httpClient.put(url, todo).subscribe();
        return true;
    }
    get_Persons() {
        var url = this.basePersonUrl + 'api/Person/';
        //console.log(url);
        return this.httpClient.get(url);
    }
    call_TodoForNewEmployee(person) {
        console.log(person);
        this.get_CreateNewEmployeeTodos(person.id, person.firstname + " " + person.lastname);
    }
    put_Address(person) {
        //console.log(todo);
        var newEmp = (person.id == "{00000000-0000-0000-0000-000000000000}");
        var url = this.basePersonUrl + 'api/Person/' + person.id;
        //console.log(url);
        if (newEmp) {
            this.httpClient.put(url, person).subscribe(data => this.call_TodoForNewEmployee(data));
        }
        else {
            this.httpClient.put(url, person).subscribe();
        }
        return true;
    }
    delete_Person(id) {
        var url = this.basePersonUrl + 'api/Person/' + id;
        //console.log(url);
        this.httpClient.delete(url).subscribe();
        url = this.baseToDoUrl + 'api/todo/' + id + "/DeleteByEmployeeId";
        this.httpClient.get(url).subscribe();
        return true;
    }
};
DataService.ctorParameters = () => [
    { type: _angular_common_http__WEBPACK_IMPORTED_MODULE_2__["HttpClient"] }
];
DataService = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Injectable"])({
        providedIn: 'root'
    })
], DataService);

class SignalRService {
    constructor() {
        this.baseToDoUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_3__["environment"].urlToDo;
        this.startConnection = () => {
            var url = this.baseToDoUrl + 'kafka';
            console.log(url);
            this.hubConnection = new _microsoft_signalr__WEBPACK_IMPORTED_MODULE_4__["HubConnectionBuilder"]()
                .withUrl(url)
                .build();
            this.hubConnection
                .start()
                .then(() => console.log('Connection started'))
                .catch(err => console.log('Error while starting connection: ' + err));
        };
        this.addTransferKafkaDataListener = () => {
            this.hubConnection.on('transferkafkadata', (data) => {
                this.data = data;
                //console.log(data);
            });
        };
    }
}


/***/ }),

/***/ "./src/Shared/Util/utilFilters.ts":
/*!****************************************!*\
  !*** ./src/Shared/Util/utilFilters.ts ***!
  \****************************************/
/*! exports provided: NameFilter, EmployeeNameFilter */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "NameFilter", function() { return NameFilter; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "EmployeeNameFilter", function() { return EmployeeNameFilter; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");

/**
* Class for filtering Field metadata in datagrids on filterType property of model
*/
class NameFilter {
    accepts(todo, search) {
        return todo.employeeName.toLowerCase().indexOf(search) >= 0;
    }
}
class EmployeeNameFilter {
    accepts(person, search) {
        console.log('here');
        return (person.firstname + " " + person.lastname).toLocaleLowerCase().indexOf(search.trim().toLocaleLowerCase()) >= 0;
    }
}


/***/ }),

/***/ "./src/app/app-routing.module.ts":
/*!***************************************!*\
  !*** ./src/app/app-routing.module.ts ***!
  \***************************************/
/*! exports provided: AppRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function() { return AppRoutingModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm2015/router.js");



const routes = [];
let AppRoutingModule = class AppRoutingModule {
};
AppRoutingModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"])({
        imports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"].forRoot(routes)],
        exports: [_angular_router__WEBPACK_IMPORTED_MODULE_2__["RouterModule"]]
    })
], AppRoutingModule);



/***/ }),

/***/ "./src/app/app.component.css":
/*!***********************************!*\
  !*** ./src/app/app.component.css ***!
  \***********************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony default export */ __webpack_exports__["default"] = (".inline-profile-pic{\r\n    max-height:30px;\r\n    max-width:30px;\r\n}\r\n\r\n.form-profile-pic{\r\n    max-height:100px;\r\n    max-width:100px;\r\n}\r\n\r\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNyYy9hcHAvYXBwLmNvbXBvbmVudC5jc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7SUFDSSxlQUFlO0lBQ2YsY0FBYztBQUNsQjs7QUFFQTtJQUNJLGdCQUFnQjtJQUNoQixlQUFlO0FBQ25CIiwiZmlsZSI6InNyYy9hcHAvYXBwLmNvbXBvbmVudC5jc3MiLCJzb3VyY2VzQ29udGVudCI6WyIuaW5saW5lLXByb2ZpbGUtcGlje1xyXG4gICAgbWF4LWhlaWdodDozMHB4O1xyXG4gICAgbWF4LXdpZHRoOjMwcHg7XHJcbn1cclxuXHJcbi5mb3JtLXByb2ZpbGUtcGlje1xyXG4gICAgbWF4LWhlaWdodDoxMDBweDtcclxuICAgIG1heC13aWR0aDoxMDBweDtcclxufVxyXG4iXX0= */");

/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/fesm2015/common.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm2015/router.js");
/* harmony import */ var _Shared_Services_data_service__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./../Shared/Services/data.service */ "./src/Shared/Services/data.service.ts");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm2015/forms.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./../environments/environment */ "./src/environments/environment.ts");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm2015/http.js");
/* harmony import */ var _clr_icons__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! @clr/icons */ "./node_modules/@clr/icons/index.js");
/* harmony import */ var _clr_icons__WEBPACK_IMPORTED_MODULE_10___default = /*#__PURE__*/__webpack_require__.n(_clr_icons__WEBPACK_IMPORTED_MODULE_10__);
/* harmony import */ var _clr_icons_shapes_all_shapes__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! @clr/icons/shapes/all-shapes */ "./node_modules/@clr/icons/shapes/all-shapes.js");
/* harmony import */ var _clr_icons_shapes_all_shapes__WEBPACK_IMPORTED_MODULE_11___default = /*#__PURE__*/__webpack_require__.n(_clr_icons_shapes_all_shapes__WEBPACK_IMPORTED_MODULE_11__);
/* harmony import */ var _Shared_Util_utilFilters__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ../Shared/Util/utilFilters */ "./src/Shared/Util/utilFilters.ts");















let AppComponent = class AppComponent {
    constructor(document, dataService, router, httpClient, signalRService) {
        this.document = document;
        this.dataService = dataService;
        this.router = router;
        this.httpClient = httpClient;
        this.signalRService = signalRService;
        this.nameFilter = new _Shared_Util_utilFilters__WEBPACK_IMPORTED_MODULE_12__["NameFilter"]();
        this.createdByFilter = new _Shared_Util_utilFilters__WEBPACK_IMPORTED_MODULE_12__["NameFilter"]();
        this.empNameFilter = new _Shared_Util_utilFilters__WEBPACK_IMPORTED_MODULE_12__["EmployeeNameFilter"]();
        this.title = 'Killer Demo';
        this.errorMessage = '';
        this.href = "";
        this.lastBuiltID = 0;
        this.buildRunning = false;
        this.fullNameSelected = "";
        this.startHttpRequest = () => {
            this.httpClient.get(_environments_environment__WEBPACK_IMPORTED_MODULE_8__["environment"].urlToDo + 'api/kafka')
                .subscribe(res => {
                console.log(res);
            });
        };
        this.removeTodo = function (item) {
            this.dataService.delete_Todos(item.id);
            this.populateTodo();
        };
        this.removePerson = function (item) {
            this.dataService.delete_Person(item.id);
            setTimeout(() => {
                this.populateAddresses();
                this.populateTodo();
            }, 1000);
        };
        this.todoForm = new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormGroup"]({
            todoText: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            dueDate: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            createdBy: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            employeeName: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null),
            id: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](''),
            createdDate: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](''),
            employeeId: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
        });
        this.addressForm = new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormGroup"]({
            firstname: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            lastname: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            streetaddress: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            city: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            state: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            zip: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            phone: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null),
            email: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](null),
            profilepicture: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](''),
            createdon: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](''),
            id: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"]('')
        });
        this.populateAddresses();
        this.populateTodoFirstLoad();
        this.getPizzatrackertimeline();
        this.href = document.location.protocol + '//' + document.location.hostname + ':' + document.location.port;
        this.redisInfo = this.dataService.get_RedisInformation();
        this.redisInfo.subscribe();
        this.env = _environments_environment__WEBPACK_IMPORTED_MODULE_8__["environment"];
        //console.log(this.env);
        //console.log(environment);
    }
    ngOnInit() {
        this.signalRService.startConnection();
        this.signalRService.addTransferKafkaDataListener();
        this.startHttpRequest();
    }
    onTodoSubmit() {
        let postedTodo;
        postedTodo = {
            createdBy: this.todoForm.value.createdBy,
            createdDate: (this.todoForm.value.createdDate != null ? this.todoForm.value.createdDate : new Date()),
            dueDate: this.todoForm.value.dueDate,
            id: (this.todoForm.value.id != null ? this.todoForm.value.id : 0),
            employeeId: this.todoForm.value.employeeId,
            employeeName: this.fullNameSelected,
            todoText: this.todoForm.value.todoText
        };
        console.log(postedTodo);
        this.dataService.put_Todos(postedTodo);
        this.todoForm.reset();
        this.populateTodo();
    }
    onChange($event) {
        this.fullNameSelected = $event.target.options[$event.target.options.selectedIndex].text;
    }
    editTodo(todo) {
        //console.log(todo);
        this.todoForm = new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormGroup"]({
            todoText: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.todoText, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            dueDate: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.dueDate, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            createdBy: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.createdBy, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            employeeName: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.employeeName),
            id: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.id),
            createdDate: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.createdDate),
            employeeId: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](todo.employeeId, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
        });
    }
    getPizzaTrackerItems(myData) {
        this.ptl = this.dataService.get_pizzatrackertimeline(myData).pipe();
        this.ptl.subscribe(val => console.log(val));
    }
    getRunningBuilds(myData) {
        if (myData.count == 0) {
            this.buildRunning = false;
            console.log("No Running Build.");
            if (this.lastBuiltID == 0) {
                let tempRunBuild = this.dataService.get_LastRunBuild(2).pipe();
                tempRunBuild.subscribe((data) => this.lastRunBuildDetails = data);
                if (this.lastRunBuildDetails != undefined) {
                    this.lastBuiltID = this.lastRunBuildDetails.value[0].id;
                }
            }
            else {
                this.ptld = this.dataService.get_BuildLogs(this.lastBuiltID).pipe();
                this.ptld.subscribe((data) => this.getPizzaTrackerItems(data));
                this.ptld = '';
            }
        }
        else {
            this.buildRunning = true;
            this.lastBuiltID = myData.value[0].id;
            this.ptld = this.dataService.get_BuildLogs(myData.value[0].id).pipe();
            this.ptld.subscribe((data) => this.getPizzaTrackerItems(data));
        }
    }
    getPizzatrackertimeline() {
        this.dataService.display_Json();
        Object(rxjs__WEBPACK_IMPORTED_MODULE_3__["interval"])(2000).pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_6__["startWith"])(0), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_6__["switchMap"])(() => this.dataService.get_RunningBuild(2))).subscribe((data) => this.getRunningBuilds(data));
    }
    populateTodo() {
        this.todoItems = this.dataService.get_Todos();
        this.todoItems.subscribe();
    }
    populateTodoFirstLoad() {
        this.todoItems = this.dataService.get_Todos();
        var ds = this.dataService;
        this.todoItems.subscribe(result => {
            if (result.length === 0) {
                //console.log(result.length)
                this.AddressItems.subscribe(x => {
                    var num = 1;
                    x.forEach(function (y) {
                        //console.log(y.id)
                        setTimeout(() => {
                            ds.get_CreateNewEmployeeTodos(y.id, y.firstname + " " + y.lastname);
                        }, num * 1000);
                        num++;
                    });
                });
            }
        });
    }
    onAddressSubmit() {
        let postedAddress;
        postedAddress = {
            firstname: this.addressForm.value.firstname,
            lastname: this.addressForm.value.lastname,
            streetaddress: this.addressForm.value.streetaddress,
            city: this.addressForm.value.city,
            state: this.addressForm.value.state,
            zip: this.addressForm.value.zip,
            phone: this.addressForm.value.phone,
            createdon: this.addressForm.value.createdon,
            email: this.addressForm.value.email,
            profilepicture: this.addressForm.value.profilepicture,
            id: (this.addressForm.value.id != null && this.addressForm.value.id != "" ? this.addressForm.value.id : "{00000000-0000-0000-0000-000000000000}")
        };
        this.dataService.put_Address(postedAddress);
        this.addressForm.reset();
        setTimeout(() => {
            this.populateAddresses();
            this.populateTodo();
        }, 1000);
    }
    populateAddresses() {
        this.AddressItems = this.dataService.get_Persons().pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_6__["take"])(5));
        //console.log(JSON.stringify(this.AddressItems));
        this.AddressItems.subscribe();
    }
    editAddress(person) {
        //console.log(person);
        this.addressForm = new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormGroup"]({
            firstname: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.firstname, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            lastname: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.lastname, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            streetaddress: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.streetaddress, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            city: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.city, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            state: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.state, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            zip: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.zip, _angular_forms__WEBPACK_IMPORTED_MODULE_7__["Validators"].required),
            phone: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.phone),
            createdon: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.createdon),
            email: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.email),
            profilepicture: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.profilepicture),
            id: new _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormControl"](person.id)
        });
        this.ppData = person.profilepicture;
        this.populateAddresses();
    }
    changeFile(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = error => reject(error);
        });
    }
    uploadFile(event) {
        if (event.target.value) {
            const file = event.target.files[0];
            const type = file.type;
            this.changeFile(file).then((base64) => {
                console.log(base64);
                //this.fileBlob = this.b64Blob([base64], type);
                //console.log(this.fileBlob)
                this.ppData = base64;
                this.addressForm.get('profilepicture').setValue(base64);
            });
        }
        else
            alert('Nothing');
    }
};
AppComponent.ctorParameters = () => [
    { type: Document, decorators: [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_1__["Inject"], args: [_angular_common__WEBPACK_IMPORTED_MODULE_2__["DOCUMENT"],] }] },
    { type: _Shared_Services_data_service__WEBPACK_IMPORTED_MODULE_5__["DataService"] },
    { type: _angular_router__WEBPACK_IMPORTED_MODULE_4__["Router"] },
    { type: _angular_common_http__WEBPACK_IMPORTED_MODULE_9__["HttpClient"] },
    { type: _Shared_Services_data_service__WEBPACK_IMPORTED_MODULE_5__["SignalRService"] }
];
AppComponent = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Component"])({
        selector: 'app-root',
        template: tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(/*! raw-loader!./app.component.html */ "./node_modules/raw-loader/dist/cjs.js!./src/app/app.component.html")).default,
        styles: [tslib__WEBPACK_IMPORTED_MODULE_0__["__importDefault"](__webpack_require__(/*! ./app.component.css */ "./src/app/app.component.css")).default]
    }),
    tslib__WEBPACK_IMPORTED_MODULE_0__["__param"](0, Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Inject"])(_angular_common__WEBPACK_IMPORTED_MODULE_2__["DOCUMENT"]))
], AppComponent);

function uuidv4() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}


/***/ }),

/***/ "./src/app/app.init.ts":
/*!*****************************!*\
  !*** ./src/app/app.init.ts ***!
  \*****************************/
/*! exports provided: AppInitService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppInitService", function() { return AppInitService; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");


;


//import { listFiles } from 'list-files-in-dir';
let AppInitService = class AppInitService {
    // This is the method you want to call at bootstrap
    // Important: It should return a Promise
    init() {
        return Object(rxjs__WEBPACK_IMPORTED_MODULE_2__["from"])(fetch('assets/app-config.json').then(function (response) {
            return response.json();
        })).pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_3__["map"])((config) => {
            window.config = config;
            return;
        })).toPromise();
    }
};
AppInitService = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["Injectable"])()
], AppInitService);



/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: init_app, AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "init_app", function() { return init_app; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/fesm2015/platform-browser.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var _app_routing_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./app-routing.module */ "./src/app/app-routing.module.ts");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _clr_angular__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @clr/angular */ "./node_modules/@clr/angular/fesm2015/clr-angular.js");
/* harmony import */ var _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! @angular/platform-browser/animations */ "./node_modules/@angular/platform-browser/fesm2015/animations.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm2015/http.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm2015/forms.js");
/* harmony import */ var _Shared_Services_data_service__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./../Shared/Services/data.service */ "./src/Shared/Services/data.service.ts");
/* harmony import */ var _app_init__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./app.init */ "./src/app/app.init.ts");











function init_app(appLoadService) {
    return () => appLoadService.init();
}
let AppModule = class AppModule {
};
AppModule = tslib__WEBPACK_IMPORTED_MODULE_0__["__decorate"]([
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_2__["NgModule"])({
        declarations: [
            _app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]
        ],
        imports: [
            _angular_platform_browser__WEBPACK_IMPORTED_MODULE_1__["BrowserModule"],
            _app_routing_module__WEBPACK_IMPORTED_MODULE_3__["AppRoutingModule"],
            _clr_angular__WEBPACK_IMPORTED_MODULE_5__["ClarityModule"],
            _angular_platform_browser_animations__WEBPACK_IMPORTED_MODULE_6__["BrowserAnimationsModule"],
            _angular_common_http__WEBPACK_IMPORTED_MODULE_7__["HttpClientModule"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_8__["FormsModule"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_8__["ReactiveFormsModule"],
        ],
        providers: [_Shared_Services_data_service__WEBPACK_IMPORTED_MODULE_9__["SignalRService"], _app_init__WEBPACK_IMPORTED_MODULE_10__["AppInitService"],
            {
                provide: _angular_core__WEBPACK_IMPORTED_MODULE_2__["APP_INITIALIZER"],
                useFactory: init_app,
                deps: [_app_init__WEBPACK_IMPORTED_MODULE_10__["AppInitService"]],
                multi: true
            }],
        bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_4__["AppComponent"]]
    })
], AppModule);



/***/ }),

/***/ "./src/environments/dynamic-environment.ts":
/*!*************************************************!*\
  !*** ./src/environments/dynamic-environment.ts ***!
  \*************************************************/
/*! exports provided: DynamicEnvironment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "DynamicEnvironment", function() { return DynamicEnvironment; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");

class DynamicEnvironment {
    get isProduction() {
        return window.config.isProduction;
    }
    get urlAddress() {
        return window.config.urlAddress;
    }
    get urlToDo() {
        return window.config.urlToDo;
    }
    get deployLocation() {
        return window.config.deployLocation;
    }
    get urlDadJoke() {
        return window.config.urlDadJoke;
    }
    get version() {
        return window.config.version;
    }
    get urlPerson() {
        return window.config.urlPerson;
    }
    get urlDevOps() {
        return window.config.urlDevOps;
    }
    get azPAT() {
        return window.config.azPAT;
    }
}


/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _dynamic_environment__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./dynamic-environment */ "./src/environments/dynamic-environment.ts");


class Environment extends _dynamic_environment__WEBPACK_IMPORTED_MODULE_1__["DynamicEnvironment"] {
    constructor() {
        super();
        this.production = false;
    }
}
const environment = new Environment();


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var tslib__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! tslib */ "./node_modules/tslib/tslib.es6.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm2015/core.js");
/* harmony import */ var _angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/platform-browser-dynamic */ "./node_modules/@angular/platform-browser-dynamic/fesm2015/platform-browser-dynamic.js");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");





if (_environments_environment__WEBPACK_IMPORTED_MODULE_4__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_1__["enableProdMode"])();
}
Object(_angular_platform_browser_dynamic__WEBPACK_IMPORTED_MODULE_2__["platformBrowserDynamic"])().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_3__["AppModule"])
    .catch(err => console.error(err));


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! d:\a\1\s\killerdemo.web.ui\ClientApp\src\main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main-es2015.js.map