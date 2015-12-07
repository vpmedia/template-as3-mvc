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
import app.ui.ApplicationContextMenuItem;
import hu.vpmedia.ui.BaseContextMenuItem;
import app.ui.DeveloperContextMenuItem;
import app.ui.ShareContextMenuItem;

import hu.vpmedia.utils.ContextMenuUtil;
import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.mvc.IBaseView;
import hu.vpmedia.mvc.Router;
import hu.vpmedia.mvc.RouterItem;
import hu.vpmedia.net.BaseTransmission;
import hu.vpmedia.net.HTTPConnection;
import hu.vpmedia.net.HTTPConnectionVars;
import hu.vpmedia.net.ServiceManager;
import hu.vpmedia.starlingmvc.StarlingRouter;
import hu.vpmedia.utils.SystemUtil;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.api.getLogger;
import org.as3commons.logging.setup.SimpleSetup;
import org.as3commons.logging.setup.target.TraceTarget;
import org.osflash.signals.ISignal;
import org.osflash.signals.Signal;

/**
 * Class
 * @author Andras Csizmadia
 */
public class ApplicationModel extends BaseModel {
    private static const LOG:ILogger = getLogger("ApplicationModel");

    //----------------------------------
    //  Helpers
    //----------------------------------

    /**
     * TBD
     */
    public var flashVars:Object;

    /**
     * TBD
     */
    public var signal:ISignal;

    //----------------------------------
    //  Managers
    //----------------------------------

    /**
     * TBD
     */
    public var serviceManager:ServiceManager;

    /**
     * TBD
     */
    public var serviceProxy:ApplicationServices;

    /**
     * TBD
     */
    public var router:Router;

    /**
     * TBD
     */
    public var starlingRouter:StarlingRouter;

    //----------------------------------
    //  Constructor
    //----------------------------------

    /**
     * Constructor
     */
    public function ApplicationModel(flashVars:Object) {
        this.flashVars = flashVars;
        super();
        initialize();
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * setupCore
     */
    private final function initialize():void {
        // logger
        LOGGER_FACTORY.setup = new SimpleSetup(new TraceTarget());
        LOG.debug(this, "initialize");
        // flash vars
        if (flashVars) {
            for (var p:String in flashVars) {
                LOG.debug(this, "flashVars::" + p + "=>" + flashVars[p]);
            }
        }
        // signal
        signal = new Signal(BaseTransmission);
        //initServiceManager
        serviceManager = new ServiceManager();
        serviceManager.signal.add(signalHandler);
        serviceManager.registerServiceProvider(HTTPConnection, HTTPConnectionVars);
        if (SystemUtil.isLocalSandbox()) {
            serviceManager.setUrlPrefix(ApplicationConfig.LOCAL_SERVER);
            // serviceManager.setAssetPrefix(ApplicationConfig.LOCAL_ASSETS);
        }
        serviceManager.loadXML(XML(new ApplicationAsset.SERVICE_CONFIG_XML()));
        serviceProxy = new ApplicationServices(this);
    }

    //----------------------------------
    //  API
    //----------------------------------

    /**
     * setupView
     * @param context
     */
    public final function initViewManager(view:IBaseView):void {
        LOG.debug(this, "initViewManager");

        const contextMenuItems:Vector.<BaseContextMenuItem> = new Vector.<BaseContextMenuItem>()
        contextMenuItems.push(new ApplicationContextMenuItem());
        contextMenuItems.push(new DeveloperContextMenuItem());
        contextMenuItems.push(new ShareContextMenuItem());
        ContextMenuUtil.addItems(view.content.parent, contextMenuItems);

        const routerItems:Array = [];
        routerItems.push(new RouterItem({view: StartView, controller: StartController, mediator: StartMediator, url: ApplicationConfig.VIEW_START_URL}));
        routerItems.push(new RouterItem({view: MainView, controller: MainController, mediator: MainMediator, url: ApplicationConfig.VIEW_MAIN_URL}));
        routerItems.push(new RouterItem({view: MultiStateView, url: ApplicationConfig.VIEW_MULTISTATE_URL}));
        routerItems.push(new RouterItem({view: MultiStateView, url: ApplicationConfig.VIEW_MULTISTATE_START_URL}));
        routerItems.push(new RouterItem({view: MultiStateView, url: ApplicationConfig.VIEW_MULTISTATE_MAIN_URL}));
        router = new Router(this, view, routerItems);
    }

    /**
     * Set view by address
     * @param value String
     */
    public final function setViewState(value:String):void {
        LOG.debug(this, "setViewState: " + value);
        router.setState(value);
    }


    /**
     * Set view by address
     * @param value String
     */
    public final function setStarlingViewState(value:String):void {
        LOG.debug("setStarlingViewState: " + value);
        starlingRouter.setState(value);
    }

    //----------------------------------
    //  Private
    //----------------------------------

    /**
     * Signal event bus
     */
    private final function signalHandler(medium:BaseTransmission):void {
        LOG.debug("signalHandler: " + medium);
        signal.dispatch(medium);
    }

    /**
     * Will return the description of the object including property information.
     */
    /*public function toString():String {
     return BaseConfig.toStr(this);
     }*/


}

}
