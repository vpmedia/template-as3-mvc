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

package app.flash {
import app.core.ApplicationConfig;
import app.core.ApplicationModel;

import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.UncaughtErrorEvent;

import hu.vpmedia.mvc.BaseController;
import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.mvc.IBaseView;
import hu.vpmedia.mvc.RouterCodes;
import hu.vpmedia.net.BaseTransmission;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * @inheritDoc
 */
public class ApplicationController extends BaseController {
    /**
     * @private
     */
    private static const LOG:ILogger = getLogger("ApplicationController");

    /**
     * Constructor
     * @param view BaseView
     * @param model BaseModel
     */
    public function ApplicationController(view:IBaseView, model:BaseModel = null) {
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
        viewContext.addEventListener(Event.ADDED_TO_STAGE, onViewAdded, false, 0, true);
    }

    protected function onViewAdded(event:Event = null):void {
        LOG.info("onViewAdded");
        viewContext.removeEventListener(Event.ADDED_TO_STAGE, onViewAdded);
        viewContext.root.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler, false, 0, true);
        appModel.signal.add(modelChangeHandler);
        appModel.router.signal.add(routerChangeHandler);
        appModel.setViewState(ApplicationConfig.VIEW_START_URL);
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void {
        LOG.info("dispose");
        viewContext.root.loaderInfo.uncaughtErrorEvents.removeEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler);
        appModel.signal.remove(modelChangeHandler);
        appModel.router.signal.remove(routerChangeHandler);
    }

    /**
     * @private
     */
    private final function routerChangeHandler(type:String, url:String):void {
        LOG.info("routerChangeHandler: " + type + " | " + url);

        if (type == RouterCodes.ROUTE_CHANGE_START) {
            viewContext.preloader.showCover();
        }
        else if (type == RouterCodes.ROUTE_CHANGE_COMPLETE) {
            viewContext.preloader.hide(0);
            //appModel.setViewState(ApplicationConfig.VIEW_MAIN_URL);
        }
    }

    /**
     * @private
     */
    private final function modelChangeHandler(medium:BaseTransmission):void {
        LOG.info("modelChangeHandler: " + medium);

        switch (medium.code) {
            case IOErrorEvent.IO_ERROR:
            case SecurityErrorEvent.SECURITY_ERROR:
            case ErrorEvent.ERROR:
            {
                viewContext.preloader.setProgress(-1);
                viewContext.preloader.setStatus(medium.code);
                viewContext.preloader.show();
                break;
            }
        }

    }

    //----------------------------------
    //  Getters
    //----------------------------------

    /**
     * @private
     */
    private final function get viewContext():ApplicationView {
        return ApplicationView(view);
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
     * @public
     */
    public function uncaughtErrorHandler(event:Event):void {
        appModel.signal.dispatch(event.type, event);
    }


    // EOC
}

// EOP
}

