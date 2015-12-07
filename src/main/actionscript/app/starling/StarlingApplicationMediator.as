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

import hu.vpmedia.starlingmvc.BaseMediator;
import hu.vpmedia.starlingmvc.IBaseView;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * Class
 * @author Andras Csizmadia
 */
public class StarlingApplicationMediator extends BaseMediator {
    private static const LOG:ILogger = getLogger("StarlingApplicationMediator");

    /**
     * Constructor
     * @param view IBaseView
     */
    public function StarlingApplicationMediator(view:IBaseView) {
        super(view);
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * @inheritDoc
     */
    override protected function initialize():void {
        LOG.info("initialize");
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void {
        LOG.info("dispose");
        super.dispose();
    }

    //----------------------------------
    //  Getter/setter
    //----------------------------------

    /**
     * @public
     */
    public function get view():StarlingApplicationView {
        return StarlingApplicationView(_view);
    }

    /**
     * @public
     */
    public function get controller():StarlingApplicationController {
        return StarlingApplicationController(_view.controller);
    }

    /**
     * @public
     */
    public function get model():ApplicationModel {
        return ApplicationModel(_view.model);
    }
}
}
