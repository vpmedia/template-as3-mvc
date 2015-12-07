/*
 * =BEGIN CLOSED LICENSE
 *
 *  Copyright(c) 2014 Andras Csizmadia.
 *  http://www.vpmedia.eu
 *
 *  For information about the licensing and copyright please
 *  contact Andras Csizmadia at andras@vpmedia.eu.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 * =END CLOSED LICENSE
 */

package app.core {
/**
 * Application Services Wrapper
 */
public class ApplicationServices {
    /**
     * Example service Id
     */
    public static const SERVICE_PING:String = "pingService";

    /**
     * @private
     */
    private var _context:ApplicationModel;

    /**
     * Constructor
     */
    public function ApplicationServices(context:ApplicationModel) {
        this._context = context;
        initialize();
    }

    /**
     * @private
     */
    private function initialize():void {
        //var service:HTTPConnection=HTTPConnection(_context.serviceManager.getService(ApplicationConfig.SERVICE_FORM));
        //service.config.contentType='multipart/form-data; boundary=' + UploadPostHelper.getBoundary();
    }

    //----------------------------------
    //  API
    //----------------------------------

    /**
     * Example service
     *
     * @param params Parameter object
     */
    public function ping(params:Object = null):void {
        _context.serviceManager.send(SERVICE_PING, params);
    }

}
}
