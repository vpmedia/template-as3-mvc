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

package app.starling {
import app.core.ApplicationConfig;
import app.core.ApplicationModel;

import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.starlingmvc.BaseController;
import hu.vpmedia.starlingmvc.IBaseView;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

import starling.events.Event;

/**
 * Class
 * @author Andras Csizmadia
 */
public class StarlingApplicationController extends BaseController {
    private static const LOG:ILogger = getLogger("StarlingApplicationController");

    /**
     * Constructor
     * @param view BaseView
     * @param model BaseModel
     */
    public function StarlingApplicationController(view:IBaseView, model:BaseModel = null) {
        super(view, model);
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * @inheritDoc
     */
    override protected function initialize():void {
        LOG.info("initialize");
        viewContext.addEventListener(Event.ADDED_TO_STAGE, onViewAdded);
    }

    protected function onViewAdded(event:Event = null):void {
        LOG.info(this, "onViewAdded");
        viewContext.removeEventListener(Event.ADDED_TO_STAGE, onViewAdded);
        appModel.starlingRouter.signal.add(routerChangeHandler);
        appModel.setStarlingViewState(ApplicationConfig.VIEW_START_URL);
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void {
        LOG.info(this, "dispose");
        appModel.starlingRouter.signal.remove(routerChangeHandler);
    }

    //----------------------------------
    //  Getters
    //----------------------------------

    /**
     * @private
     */
    private final function get viewContext():StarlingApplicationView {
        return StarlingApplicationView(view);
    }

    /**
     * @private
     */
    private final function get appModel():ApplicationModel {
        return ApplicationModel(_model);
    }

    //----------------------------------
    //  Event handlers
    //----------------------------------

    /**
     * @private
     */
    private final function routerChangeHandler(type:String, url:String):void {
        LOG.info("routerChangeHandler: " + type + " | " + url);
    }

    // EOC
}

// EOP
}

