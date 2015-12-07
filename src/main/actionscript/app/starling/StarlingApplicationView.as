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
import app.flash.ApplicationContext;

import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.mvc.RouterItem;
import hu.vpmedia.starlingmvc.BaseView;
import hu.vpmedia.starlingmvc.IBaseController;
import hu.vpmedia.starlingmvc.StarlingRouter;

import starling.core.Starling;
import starling.display.Sprite;

/**
 * @inheritDoc
 */
public class StarlingApplicationView extends BaseView {

    /**
     * @private
     */
    private var _content:Sprite;

    /**
     * Constructor
     * @param model BaseModel
     */
    function StarlingApplicationView(model:BaseModel, controller:IBaseController = null) {
        super(model, controller);
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------
    /**
     * @inheritDoc
     */
    override protected function createChildren():void {
        _content = new Sprite();
        addChild(_content);
        Starling.current.nativeOverlay.addChild(new ApplicationContext(_model));
        var states:Array = [];
        states.push(new RouterItem({view: StarlingStartView, controller: StarlingStartController, mediator: StarlingStartMediator, url: ApplicationConfig.VIEW_START_URL}));
        appModel.starlingRouter = new StarlingRouter(_model, this, states);
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
    private function get appController():StarlingApplicationController {
        return StarlingApplicationController(_controller);
    }

    /**
     * @inheritDoc
     */
    override public function get content():Sprite {
        return _content;
    }


    // EOC
}
// EOP
}
