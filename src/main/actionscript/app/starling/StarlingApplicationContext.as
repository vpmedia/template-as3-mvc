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
import app.core.ApplicationModel;

import hu.vpmedia.starlingmvc.BaseContext;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.events.Event;

/**
 * Class
 * @author Andras Csizmadia
 */
public class StarlingApplicationContext extends BaseContext {
    /**
     * Constructor
     * @param model BaseModel
     */
    function StarlingApplicationContext() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }

    //----------------------------------
    //  Lifecycle
    //----------------------------------

    /**
     * @inheritDoc
     */
    override protected function initialize():void {
        // init listeners
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
        // init mvc
        _model = new ApplicationModel(Starling.current.nativeStage.loaderInfo.parameters);
        _view = new StarlingApplicationView(_model);
        _controller = new StarlingApplicationController(_view, _model);
        _view.controller = _controller;
        _mediator = new StarlingApplicationMediator(_view);
        addChild(DisplayObject(_view));
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void {
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
    }

    //----------------------------------
    //  Event Handlers
    //----------------------------------

    /**
     * @private
     */
    private function onAdded(event:Event):void {
        initialize();
    }

    /**
     * @private
     */
    private function onRemoved(event:Event):void {
        dispose();
    }

    // EOC
}
// EOP
}
