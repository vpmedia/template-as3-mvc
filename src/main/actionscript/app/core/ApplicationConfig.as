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
import app.flash.*;

import hu.vpmedia.mvc.RouterItem;

//import Namespace.*;

/**
 * TBD
 */
public class ApplicationConfig {
    //----------------------------------
    //  Constructor
    //----------------------------------

    /**
     * TBD
     */
    public function ApplicationConfig() {
        throw new Error("Static helper class");
    }

    //----------------------------------
    //  Project meta data
    //----------------------------------

    /**
     * TBD
     */
    public static const PROJECT_NAME:String = "AS3 Framework Application";

    /**
     * TBD
     */
    public static const PROJECT_VERSION:String = "2.0.0";

    /**
     * TBD
     */
    public static const PROJECT_DATE:String = "2014";

    /**
     * TBD
     */
    public static const AUTHOR_NAME:String = "Andras Csizmadia <andras@vpmedia.eu>";

    /**
     * TBD
     */
    public static const AUTHOR_URL:String = "http://www.vpmedia.eu";

    //----------------------------------
    //  Stage static size
    //----------------------------------

    /**
     * TBD
     */
    public static const STAGE_IS_FLUID:Boolean = false;

    /**
     * TBD
     */
    public static const STAGE_WIDTH:int = 800;

    /**
     * TBD
     */
    public static const STAGE_HEIGHT:int = 600;

    /**
     * TBD
     */
    public static const STAGE_HALF_WIDTH:Number = STAGE_WIDTH >> 1;

    /**
     * TBD
     */
    public static const STAGE_HALF_HEIGHT:Number = STAGE_HEIGHT >> 1;

    //----------------------------------
    //  XML support
    //----------------------------------

    /**
     * TBD
     */
    public static const xhtml:Namespace = new Namespace("http://www.w3.org/1999/xhtml");
    default xml namespace = new Namespace("http://www.w3.org/1999/xhtml");

    //----------------------------------
    //  View Manager
    //----------------------------------

    /**
     * TBD
     */
    public static const VIEW_START_URL:String = "/";

    /**
     * TBD
     */
    public static const VIEW_MAIN_URL:String = "/main/";

    /**
     * TBD
     */
    public static const VIEW_MULTISTATE_URL:String = "/multistate/";

    /**
     * TBD
     */
    public static const VIEW_MULTISTATE_START_URL:String = "/multistate/start/";

    /**
     * TBD
     */
    public static const VIEW_MULTISTATE_MAIN_URL:String = "/multistate/main/";

    /**
     * TBD
     */
    public static const LOCAL_SERVER:String = "http://localhost/appframework_v5/projects/php-mock-webapp";


}

}
