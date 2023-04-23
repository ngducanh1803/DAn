(window.webpackJsonp=window.webpackJsonp||[]).push([[28],{2230:function(e,a,t){"use strict";t.r(a);var r=t(64),s=t(72),n=t(92),l=t(91),i=t(0),o=t.n(i),m=t(3),c=t.n(m),d=t(1440),u=t(1438),g=t(1627),p=t(1430),h=t(1426),E=t(1436),v=t(1528),f=t(24),_=t.n(f),w=c.a.API_ENPOINT+"/public",x=function(e){var a=w+"/signUpAndCreateHealthOrg";return _.a.post(a,e)},y=function(e){var a=w+"/checkUsername";return _.a.post(a,e)},M=function(e){var a=w+"/checkEmail";return _.a.post(a,e)},C=t(2218),b=(i.Component,t(171)),N=t(58);t(209);N.a.configure();var P=function(e){Object(n.a)(t,e);var a=Object(l.a)(t);function t(e){var s;return Object(r.a)(this,t),(s=a.call(this,e)).state={username:"",email:"",password:"",re_password:"",agreement:!1,confirmPassword:"",isView:!0,eqaRound:null,healthOrgType:null,hasErrorEQARound:!1,hasErrorHealthOrgType:!1,shouldOpenSignupSuccessDialog:!1,passwordIsMasked:!0,confirmPasswordIsMasked:!0},s.handleChange=function(e,a){e.persist(),"checkbox"===a&&s.setState({isView:!e.target.checked,agreement:e.target.checked}),s.setState({[e.target.name]:e.target.value})},s.handleSelectEQARound=function(e){var a=e.target.value;s.setState({eqaRound:a},function(){})},s.handleSelectHealthOrgType=function(e){var a=e.target.value;s.setState({healthOrgType:a},function(){})},s.handleFormSubmit=function(e){var a={},t=s.props.t,r=s.state,n=r.password,l=r.re_password;a.email=s.state.email.trim(),a.username=s.state.email.trim(),n.length<8&&l.length<8?N.a.warning(t("sign_up.weak_password")):n===l?y(a).then(function(e){e&&e.data&&""!=e.data?N.a.error(t("sign_up.duplicate_email")):M(a).then(function(e){e&&e.data&&""!=e.data?N.a.error(t("sign_up.duplicate_email")):x(s.state).then(function(e){null!=e&&null!=e.data&&""!=e.data?e.data.duplicateEmail?N.a.error(t("sign_up.duplicate_email")):e.data.sendEmailFailed&&N.a.error(t("sign_up.error_email")):N.a.error(t("sign_up.error_signup")),N.a.success(t("mess_SignUp")),s.props.history.push("/session/signin")})},function(e){N.a.error(t("sign_up.error_signup"))})},function(e){N.a.error(t("sign_up.error_signup"))}):N.a.warning(t("sign_up.duplicate_pass"))},s.togglePasswordMask=function(){s.setState(function(e){return{passwordIsMasked:!e.passwordIsMasked}})},s.toggleConfirmPasswordMask=function(){s.setState(function(e){return{confirmPasswordIsMasked:!e.confirmPasswordIsMasked}})},s}return Object(s.a)(t,[{key:"componentDidMount",value:function(){var e=this;v.ValidatorForm.addValidationRule("isPasswordMatch",function(a){return a===e.state.password}),v.ValidatorForm.addValidationRule("isLengthNumber",function(e){return!(e.length>10)})}},{key:"componentWillUnmount",value:function(){v.ValidatorForm.removeValidationRule("isPasswordMatch")}},{key:"render",value:function(){var e=this,a=this.props,t=a.t,r=(a.i18n,this.state),s=r.fax,n=r.officerPosion,l=r.unitCodeOfProgramPEQAS,i=r.name,m=r.taxCodeOfTheUnit,f=(r.description,r.address),_=(r.healthOrgType,r.contactName),w=r.contactPhone,x=(r.listEQARound,r.eqaRound,r.hasErrorEQARound,r.listHealthOrgType,r.hasErrorHealthOrgType,r.username,r.email),y=r.password,M=(r.isView,r.re_password),C=r.passwordIsMasked,b=r.confirmPasswordIsMasked;return o.a.createElement(v.ValidatorForm,{ref:"form",onSubmit:this.handleFormSubmit},o.a.createElement("div",{className:"signup flex flex-center w-100 h-100vh"},o.a.createElement("div",{className:"p-8"},o.a.createElement(d.a,{className:"signup-card-customs position-relative y-center"},o.a.createElement(u.a,{container:!0},o.a.createElement(u.a,{item:!0,lg:2,md:2,sm:2,xs:12},o.a.createElement("div",{className:"p-32 flex flex-center bg-light-gray flex-middle h-100"},o.a.createElement("img",{src:"/assets/images/illustrations/posting_photo.svg",alt:""}))),o.a.createElement(u.a,{item:!0,lg:10,md:10,sm:10,xs:12},o.a.createElement(u.a,{container:!0,spacing:2},o.a.createElement(u.a,{item:!0,lg:12,md:12,sm:12,xs:12},o.a.createElement("div",{className:"pt-16"},o.a.createElement("h4",{className:"text-center"},t("sign_up.title_form"))))),o.a.createElement(u.a,{item:!0,lg:12,md:12,sm:12,xs:12,className:"m-16"},o.a.createElement(u.a,{container:!0,spacing:2},o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",className:"w-100",variant:"outlined",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.healthOrgName")),onChange:this.handleChange,type:"text",name:"name",value:i,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",className:"w-100",variant:"outlined",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("Email")),onChange:this.handleChange,type:"email",name:"email",value:x,validators:["required","isEmail"],errorMessages:[t("general.errorMessages_required"),t("general.errorMessages_email_valid")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.taxCodeOfTheUnit")),onChange:this.handleChange,type:"text",name:"taxCodeOfTheUnit",value:m,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.unitCodeOfProgramPEQAS")),onChange:this.handleChange,type:"text",name:"unitCodeOfProgramPEQAS",value:l,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.contactName")),onChange:this.handleChange,type:"text",name:"contactName",value:_,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.officerPosion")),onChange:this.handleChange,type:"text",name:"officerPosion",value:n,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.contactPhone")),onChange:this.handleChange,type:"text",name:"contactPhone",value:w,validators:["required","matchRegexp:^[0-9]*$","isLengthNumber"],errorMessages:[t("general.errorMessages_required"),t("general.errorMessages_phone_number_invalid"),t("general.errorMessages_phone_number_invalid")]})),o.a.createElement(u.a,{item:!0,lg:6,md:6,sm:6,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:t("sign_up.fax"),onChange:this.handleChange,type:"text",name:"fax",value:s})),o.a.createElement(u.a,{item:!0,lg:12,md:12,sm:12,xs:12},o.a.createElement(v.TextValidator,{size:"small",variant:"outlined",className:"w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("sign_up.address")),onChange:this.handleChange,name:"address",value:f,validators:["required"],errorMessages:[t("general.errorMessages_required")]})),o.a.createElement(u.a,{item:!0,sm:6,xs:12},o.a.createElement(v.TextValidator,{className:"mb-16 w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("password")),variant:"outlined",onChange:this.handleChange,name:"password",type:C?"password":"text",value:y,validators:["required"],errorMessages:[t("general.errorMessages_required")],InputProps:{endAdornment:o.a.createElement(g.a,{position:"end"},o.a.createElement(p.a,{onClick:this.togglePasswordMask},C?o.a.createElement(h.a,{color:"primary",title:t("show_password")},"visibility_off"):o.a.createElement(h.a,{color:"primary",title:t("hide_password")},"visibility")))}})),o.a.createElement(u.a,{item:!0,sm:6,xs:12},o.a.createElement(v.TextValidator,{className:"mb-16 w-100",label:o.a.createElement("span",null,o.a.createElement("span",{style:{color:"red"}}," * "),t("re_password")),variant:"outlined",onChange:this.handleChange,name:"re_password",type:b?"password":"text",value:M,validators:["required","isPasswordMatch"],errorMessages:[t("general.errorMessages_required"),t("general.isPasswordMatch")],InputProps:{endAdornment:o.a.createElement(g.a,{position:"end"},o.a.createElement(p.a,{onClick:this.toggleConfirmPasswordMask},b?o.a.createElement(h.a,{color:"primary",title:t("show_password")},"visibility_off"):o.a.createElement(h.a,{color:"primary",title:t("hide_password")},"visibility")))}}))),o.a.createElement(u.a,{item:!0,lg:12,md:12,sm:12,xs:12},o.a.createElement("div",null,o.a.createElement("div",{className:"flex flex-middle mt-16"},o.a.createElement(E.a,{className:"capitalize ",variant:"contained",color:"primary",type:"submit"},t("sign_up.title")),o.a.createElement("span",{className:"ml-16 mr-8"},t("or")),o.a.createElement(E.a,{className:"capitalize",variant:"contained",onClick:function(){return e.props.history.push(c.a.ROOT_PATH+"session/signin")}},t("sign_in.title"))))))))))))}}]),t}(i.Component);a.default=Object(b.b)(function(e){return{}},{})(P)}}]);
//# sourceMappingURL=28.8093e896.chunk.js.map