public class GoogleDriveFileUpload {
 
   //  The boundary is alligned so it doesn't produce padding characters when base64 encoded.
    private final static string Boundary = '----------------------------741e90d31eff';
    private final static String Delimiter = '\r\n--' + Boundary + '\r\n';
    private final static String Closing_Delimiter = '\r\n--' + Boundary + '--';
    private final static String sLineBreak = '\r\n';
    
    /**
*  Write a boundary between parameters to the form's body.
*/
    public static string WriteBoundary() {
        string value = '--' + Boundary + '\r\n';
        blob valueBlob = blob.valueOf(value);
        
        return EncodingUtil.base64Encode(valueBlob);
    }
    
    /**
*  Pad the value with spaces until the base64 encoding is no longer padded.
*/
    private static string SafelyPad(string value, string encodedValue, string lineBreaks) {
        while (encodedValue.endsWith('=')) {
            value += ' ';
            encodedValue = EncodingUtil.base64Encode(blob.valueOf(value + lineBreaks));
        }
        return encodedValue;
    }
 
 /**
*  Wirte a file to the form's body.
*/
    public static String WriteFile(string fileName, string fileType, blob fileBlob) {
        
        String sBodyHeader = 'Content-Type: '+CatchUtilities.CONTENT_TYPE_JSON+'\r\n\r\n';
        String sFolderPath = '"parents" : ["'+CatchUtilities.SF_GOOGLE_DRIVE_FOLDER_ID+'"]';  
        String sBodyHeaderJson = '{"name" : "' +fileName+'",' + ' "value" : "' + CatchUtilities.SF_FILE_DESCRIPTION + '",'+sFolderPath+'}';
        System.debug('sBodyHeaderJson - '+sBodyHeaderJson);
        String sBodyContentType = 'Content-Type: '+CatchUtilities.CONTENT_TYPE_OCTECT_STREAM+'\r\n'+'Content-Transfer-Encoding: base64\r\n' + '\r\n';
        String bodyEncoded =  EncodingUtil.base64Encode(fileBlob);
        
        String sBody = Delimiter + sBodyHeader + sBodyHeaderJson + Delimiter + sBodyContentType;
        System.debug('Body - '+sBody);
        sBody+= bodyEncoded  + Closing_Delimiter;
                
        return sBody;
    }
   
     /**
*  Google Drive Callout using Named Credential and oAuth.
*/ 
    
    public static void BankAccountCSVFile_HTTPCallout(string fileName, string fileType, blob fileBlob){
        String sBody = WriteFile(fileName, fileType, fileBlob);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        ///'+CatchUtilities.SF_GOOGLE_DRIVE_FOLDER_ID+'/
        request.setEndpoint('callout:GoogleDriveOAuth/upload/drive/v3/files/?uploadType=multipart');
       
        request.setHeader('Content-Type', 'multipart/mixed; boundary="' + boundary + '"');
        request.setHeader('Content-Type', CatchUtilities.CONTENT_TYPE_MULTIPART_MIXED + '; boundary='+Boundary);
        request.setHeader('Content-length', String.valueOf(sBody.length()));
        request.setBody(sBody);
        request.setMethod(CatchUtilities.HTTP_POST);
        
        request.setTimeout(120000);
        System.debug('Request Header - ' + request.getHeader('Content-Type'));
        System.debug('Request Body - ' + request.getBody());
        HttpResponse response = http.send(request);
        

        System.debug('----- Upload HTTP Response'+response.getStatusCode()+ response.getBody());
    }
    }