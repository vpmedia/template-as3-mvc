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
import app.core.ApplicationModel;

import flash.display.Sprite;

import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.mvc.BaseView;
import hu.vpmedia.mvc.IBaseController;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * @inheritDoc
 */
public class ApplicationView extends BaseView {

    /**
     * @private
     */
    private static const LOG:ILogger = getLogger("ApplicationView");

    /**
     * @private
     */
    private var _preloader:ApplicationPreloader;

    /**
     * @private
     */
    private var _content:Sprite;

    /**
     * @private
     */
    public var background:Sprite;

    /**
     * @private
     */
    public var overlay:Sprite;

    /**
     * @private
     */
    public var popup:Sprite;

    /**
     * Constructor
     * @param model BaseModel
     */
    function ApplicationView(model:BaseModel, controller:IBaseController = null) {
        super(model, controller);
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * @inheritDoc
     */
    override protected function createChildren():void {
        LOG.info("createChildren");
        // containers
        background = new Sprite();
        addChild(background);
        _content = new Sprite();
        addChild(_content);
        overlay = new Sprite();
        addChild(overlay);
        popup = new Sprite();
        addChild(popup);
        // popups
        _preloader = new ApplicationPreloader();
        popup.addChild(_preloader);
        // view stack manager
        appModel.initViewManager(this);
    }

    /**
     * @inheritDoc
     */
    override protected function createListeners():void {
        // TODO
    }

    /**
     * @inheritDoc
     */
    override protected function removeListeners():void {
        // TODO
    }

    //----------------------------------
    //  Getters
    //----------------------------------

    /**
     * @private
     */
    private function get appModel():ApplicationModel {
        return ApplicationModel(_model);
    }

    /**
     * @private
     */
    private function get appController():ApplicationController {
        return ApplicationController(_controller);
    }

    /**
     * @inheritDoc
     */
    override public function get content():Sprite {
        return _content;
    }

    /**
     * TBD
     */
    public function get preloader():ApplicationPreloader {
        return ApplicationPreloader(_preloader);
    }

    // EOC
}
// EOP
}
