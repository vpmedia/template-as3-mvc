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
import com.greensock.TweenMax;

import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.starlingmvc.BaseView;
import hu.vpmedia.starlingmvc.IBaseController;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * Class
 * @author Andras Csizmadia
 */
public class StarlingStartView extends BaseView {
    private static const LOG:ILogger = getLogger("StarlingStartView");

    /**
     * Constructor
     */
    function StarlingStartView(model:BaseModel, controller:IBaseController = null) {
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
        /*graphics.beginFill(0xFF0000);
         graphics.drawRect(0, 0, 800, 600);
         graphics.endFill();  */

        alpha = 0;
    }

    //----------------------------------
    //  Animations
    //----------------------------------

    /**
     * @inheritDoc
     */
    override public function transitionIn():void {
        signalSet.transitionInStart.dispatch();

        var d:Number = 0;
        TweenMax.to(this, 1, {alpha: 1, delay: d += 0.0, onComplete: signalSet.transitionInComplete.dispatch});
    }

    /**
     * @inheritDoc
     */
    override public function transitionOut():void {
        TweenMax.killTweensOf(this);
        signalSet.transitionOutStart.dispatch();

        var d:Number = 0;
        TweenMax.to(this, 1, {alpha: 0, delay: d += 0.0, onComplete: signalSet.transitionOutComplete.dispatch});
    }

    // EOC

}

// EOP

}
