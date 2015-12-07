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

import hu.vpmedia.mvc.BaseMediator;
import hu.vpmedia.mvc.IBaseView;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * @inheritDoc
 */
public class MainMediator extends BaseMediator {
    private static const LOG:ILogger = getLogger("MainMediator");

    /**
     * Constructor
     * @param view IBaseView
     */
    public function MainMediator(view:IBaseView) {
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
     * TBD
     */
    public function get view():MainView {
        return MainView(_view);
    }

    /**
     * TBD
     */
    public function get controller():MainController {
        return MainController(_view.controller);
    }

    /**
     * TBD
     */
    public function get model():ApplicationModel {
        return ApplicationModel(_view.model);
    }
}
}
