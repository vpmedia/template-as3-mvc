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

import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.starlingmvc.BaseController;
import hu.vpmedia.starlingmvc.IBaseView;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

/**
 * Class
 * @author Andras Csizmadia
 */
public class StarlingStartController extends BaseController {
    private static const LOG:ILogger = getLogger("StarlingStartController");

    /**
     * Constructor
     * @param view BaseView
     * @param model BaseModel
     */
    public function StarlingStartController(view:IBaseView, model:BaseModel) {
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
    }

    /**
     * @inheritDoc
     */
    override public function dispose():void {
        LOG.info("dispose");
    }

    //----------------------------------
    //  Getters
    //----------------------------------

    /**
     * @private
     */
    private function get viewContext():StarlingStartView {
        return StarlingStartView(_view);
    }

    /**
     * @private
     */
    private function get appModel():ApplicationModel {
        return ApplicationModel(_model);
    }

    //----------------------------------
    //  Event Handlers
    //----------------------------------

    // EOC
}

// EOP
}

