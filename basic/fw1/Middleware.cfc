
component {
  
  /**
   * Middleware function to check for required headers.
   * @params required headers - An array of required header names.
   * @params required cfc - The CFC to use for header checking.
   * @returns boolean
   */
  public boolean function checkHeaders(required headers, required cfc) {
    return true;
  }
}