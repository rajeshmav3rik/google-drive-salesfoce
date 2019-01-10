public class CatchUtilities {
    
    public static Boolean isTirggerExecuted = true;
    
    //@description: Static variables to control execution of Triggers.
    public static Boolean USER_TRIGGER_CONTROLLER = TRUE;
    public static Boolean CONTACT_TRIGGER_CONTROLLER = TRUE;
    public static Boolean DOCUSIGNSTATUS_TRIGGER_CONTROLLER = TRUE;
    
    //.. Common Parameters
    public static final String COMPANY_NAME = 'Catch of the Day'; 
    
    //.. Billing Account
    public static final String BILLING_ACCOUNT_STATUS_ACTIVE = 'Active';
    
    //.. Error Messages.
    public static final String BA_NAME_ERROR = 'A record with this combination of Account, Currency and Supply type already exists in the system. Please use the existing record, or change the Account, Currency or Supply Type to continue.';
    public static final String HTTP_ERR_MSG_201 = 'Recrod sucessfully created.';
    public static final String HTTP_ERR_MSG_409 = 'Conflict - record already exist.';
    public static final String HTTP_ERR_MSG_403 = 'Insufficient rights.';
    
    //.. Billing Account creation (SAGE API)
    public static final String ENDPOINT_SAGE_BILLING_ACCOUNT = 'http://sage.catchgroup.com.au:8080/Sage300WebApi/v1.0/-/ASHDAT/AP/APVendors';
    public static final String BA_SUPPLY_TYPE_CONSIGNMENT = 'Consignment';
    public static final String BA_SUPPLY_TYPE_DROPSHIP = 'Dropship';
    public static final String BA_PAYMENT_TERM_PREFIX = 'P';
    public static final String BA_STATUS_SAGEAPI_SUCCESS = 'Pending EFTPAC';
    public static final String BA_STATUS_SAGEAPI_ERROR = 'Error';
    public static final String BA_STATUS_AWAITING_SAGE = 'Awaiting Sage setup';
    
    //.. CSV File upload paramters.
    public static final String CSV_BA_ENDPOINT = 'http://operations.catchgroup.com.au:8081/api/sage-api/createEFTPAC';
    public static final String BA_CSV_FILENAME = 'CTOD_Billing_Account.csv';
    public static final String BA_BODY_KEYNAME = 'sourceFile';
    public static final String BA_STATUS_CSV_ERROR = 'Error';
    public static final String BA_STATUS_CSV_ACTIVE = 'Active';
    
    //.. DOCLink Endpoint, Params and XML Doc parameters and default value
    public static final String DOCKLINK_ENDPOINT = 'http://operations.catchgroup.com.au:8081/api/doclink-api/indexDocument';
    public static final String DOCLINK_DOCUMENT_TYPE_VALUE = 'AP Vendor Creation';
    public static final String DOCLINK_DOCUMENT_TYPE_FIELD = 'DocumentType';
    public static final String DOCLINK_COMPANY_FIELD = 'Company';
    public static final String DOCLINK_FILENAME_FIELD = 'ImageFileName';
    public static final String DOCLINK_XML_PARENT_DOCUMENTS = 'Documents';
    public static final String DOCLINK_XML_PARENT_DOCUMENT = 'Document';
    public static final String DOCLINK_XML_PARENT_DATE_CREATED = 'DateCreated';
    public static final String SOURCEFILE_BODY_KEYNAME = 'sourceFile';
    public static final String METADATA_BODY_KEYNAME = 'definitionFile';
    
   // public static final String SOURCEFILE_BODY_KEYVALUE_PDF = 'file.pdf';
  //  public static final String SOURCEFILE_BODY_KEYVALUE_TIFF = 'file.TIFF';
  //  public static final String METADATA_BODY_KEYVALUE = 'metadata.xml';
    
    public static final STring SF_XML_FILE_EXTENSION = '.XML';
    
    //.. Integration Generic parameters.
    public static final String DUMMY_SEPERATOR = '-------COTD-------COTD-------';
    public static final String CONTENT_TYPE_MULTIPART_DATA = 'multipart/form-data';
    public static final String CONTENT_TYPE_MULTIPART_MIXED = 'multipart/mixed';
    public static final String CONTENT_TYPE_APP_URL_ENCODED = 'application/x-www-form-urlencoded';
    public static final String CONTENT_TYPE_APP_JSON = 'application/json;charset=UTF-8';
    public static final String CONTENT_TYPE_OCTECT_STREAM = 'application/octet-stream';
    public static final String CONTENT_TYPE_JSON = 'application/json';
    public static final String CONTENT_TYPE_TEXT_CSV = 'text/csv';
    public static final String HTTP_POST = 'POST';
    public static final String AUTH_KEY = '82bcd6a2-1693-4695-82d9-6ad75a6a81c5';
    public static final Integer HTTP_REQUEST_TIME_OUT = 120000;
    
    //.. Doclink aUpload parameters
    public static final String SF_FILE_REQ_STATUS_NEW = 'New';
    public static final String SF_FILE_REQ_STATUS_QUEUED = 'Queued';
    public static final String SF_FILE_REQ_STATUS_DOCLINK_FAILED = 'DocLink Error';
    public static final String SF_FILE_REQ_STATUS_DOCLINK_SUCCESS = 'DocLink Success';
    public static final String SF_REQUEST_TYPE_METADATA = 'Metadata';    
    public static final String SF_REQUEST_TYPE_CONTENT = 'Content';

    public static final String SF_FILE_DESCRIPTION = 'File upload via Salesforce REST API (Vendor on boarding)';
    public static final String SF_GOOGLE_DRIVE_FOLDER_ID = '1Ln_Xyv6sg_lBNhdqWYixMF56Kea_Ewxc';

    
    /**
     * @Description: Convert string to Single Quotes
     */
    public static String toSOQL(Object value) {
        return '\'' + String.valueOf(value) + '\'';
    }
}