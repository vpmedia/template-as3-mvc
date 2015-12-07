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
import flash.display.DisplayObject;
import flash.display.StageAlign;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.events.Event;

import hu.vpmedia.mvc.BaseContext;
import hu.vpmedia.mvc.BaseModel;

/**
 * @inheritDoc
 */
public class ApplicationContext extends BaseContext {
    /**
     * Constructor
     * @param model BaseModel
     */
    function ApplicationContext(model:BaseModel) {
        super();
        _model = model;
        addEventListener(Event.ADDED_TO_STAGE, onAdded, false, 0, true);
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
        addEventListener(Event.REMOVED_FROM_STAGE, onRemoved, false, 0, true);
        // init stage
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.frameRate = 30;
        stage.stageFocusRect = false;
        stage.quality = StageQuality.HIGH;
        stage.showDefaultContextMenu = false;
        // init mvc
        _view = new ApplicationView(model);
        _controller = new ApplicationController(_view, model);
        _view.controller = _controller;
        _mediator = new ApplicationMediator(_view);
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
