﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.18063
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

// 
// 此源代码是由 Microsoft.VSDesigner 4.0.30319.18063 版自动生成。
// 
#pragma warning disable 1591

namespace DAL.sapService {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    // CODEGEN: 未处理命名空间“http://schemas.xmlsoap.org/ws/2004/09/policy”中的可选 WSDL 扩展元素“Policy”。
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="ZMMRFIDSERBINDING", Namespace="urn:sap-com:document:sap:soap:functions:mc-style")]
    public partial class ZMMRFIDSER : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback ZmmfRfidWsOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public ZMMRFIDSER() {
            this.Url = global::DAL.Properties.Settings.Default.rfidSystem_DAL_sapService_ZMMRFIDSER;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event ZmmfRfidWsCompletedEventHandler ZmmfRfidWsCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("urn:sap-com:document:sap:soap:functions:mc-style:ZMMRFID:ZmmfRfidWsRequest", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Bare)]
        [return: System.Xml.Serialization.XmlElementAttribute("ZmmfRfidWsResponse", Namespace="urn:sap-com:document:sap:soap:functions:mc-style")]
        public ZmmfRfidWsResponse ZmmfRfidWs([System.Xml.Serialization.XmlElementAttribute("ZmmfRfidWs", Namespace="urn:sap-com:document:sap:soap:functions:mc-style")] ZmmfRfidWs ZmmfRfidWs1) {
            object[] results = this.Invoke("ZmmfRfidWs", new object[] {
                        ZmmfRfidWs1});
            return ((ZmmfRfidWsResponse)(results[0]));
        }
        
        /// <remarks/>
        public void ZmmfRfidWsAsync(ZmmfRfidWs ZmmfRfidWs1) {
            this.ZmmfRfidWsAsync(ZmmfRfidWs1, null);
        }
        
        /// <remarks/>
        public void ZmmfRfidWsAsync(ZmmfRfidWs ZmmfRfidWs1, object userState) {
            if ((this.ZmmfRfidWsOperationCompleted == null)) {
                this.ZmmfRfidWsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnZmmfRfidWsOperationCompleted);
            }
            this.InvokeAsync("ZmmfRfidWs", new object[] {
                        ZmmfRfidWs1}, this.ZmmfRfidWsOperationCompleted, userState);
        }
        
        private void OnZmmfRfidWsOperationCompleted(object arg) {
            if ((this.ZmmfRfidWsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.ZmmfRfidWsCompleted(this, new ZmmfRfidWsCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.34234")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="urn:sap-com:document:sap:soap:functions:mc-style")]
    public partial class ZmmfRfidWs {
        
        private string exidvField;
        
        private Zsrfidoutput[] gtOutputField;
        
        private string matnrField;
        
        private string werksField;
        
        private string zlgortOriField;
        
        private string zlgortTarField;
        
        private string zpltnField;
        
        private string zpointField;
        
        private string zsjnoField;
        
        private string ztypeField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Exidv {
            get {
                return this.exidvField;
            }
            set {
                this.exidvField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlArrayAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        [System.Xml.Serialization.XmlArrayItemAttribute("item", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable=false)]
        public Zsrfidoutput[] GtOutput {
            get {
                return this.gtOutputField;
            }
            set {
                this.gtOutputField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Matnr {
            get {
                return this.matnrField;
            }
            set {
                this.matnrField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Werks {
            get {
                return this.werksField;
            }
            set {
                this.werksField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ZlgortOri {
            get {
                return this.zlgortOriField;
            }
            set {
                this.zlgortOriField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ZlgortTar {
            get {
                return this.zlgortTarField;
            }
            set {
                this.zlgortTarField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Zpltn {
            get {
                return this.zpltnField;
            }
            set {
                this.zpltnField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Zpoint {
            get {
                return this.zpointField;
            }
            set {
                this.zpointField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Zsjno {
            get {
                return this.zsjnoField;
            }
            set {
                this.zsjnoField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Ztype {
            get {
                return this.ztypeField;
            }
            set {
                this.ztypeField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.34234")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="urn:sap-com:document:sap:soap:functions:mc-style")]
    public partial class Zsrfidoutput {
        
        private string zsjnoField;
        
        private string ztypeField;
        
        private string mTypeField;
        
        private string mMessField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Zsjno {
            get {
                return this.zsjnoField;
            }
            set {
                this.zsjnoField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Ztype {
            get {
                return this.ztypeField;
            }
            set {
                this.ztypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string MType {
            get {
                return this.mTypeField;
            }
            set {
                this.mTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string MMess {
            get {
                return this.mMessField;
            }
            set {
                this.mMessField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.34234")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(AnonymousType=true, Namespace="urn:sap-com:document:sap:soap:functions:mc-style")]
    public partial class ZmmfRfidWsResponse {
        
        private Zsrfidoutput[] gtOutputField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlArrayAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        [System.Xml.Serialization.XmlArrayItemAttribute("item", Form=System.Xml.Schema.XmlSchemaForm.Unqualified, IsNullable=false)]
        public Zsrfidoutput[] GtOutput {
            get {
                return this.gtOutputField;
            }
            set {
                this.gtOutputField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    public delegate void ZmmfRfidWsCompletedEventHandler(object sender, ZmmfRfidWsCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.17929")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class ZmmfRfidWsCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal ZmmfRfidWsCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public ZmmfRfidWsResponse Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((ZmmfRfidWsResponse)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591