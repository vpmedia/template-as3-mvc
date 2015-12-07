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
import hu.vpmedia.mvc.BaseModel;
import hu.vpmedia.mvc.BaseView;
import hu.vpmedia.mvc.IBaseController;

/**
 * @inheritDoc
 */
public class MultiStateView extends BaseView {
    public function MultiStateView(model:BaseModel = null, controller:IBaseController = null) {
        super(model, controller);
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * @inheritDoc
     */
    override protected function createChildren():void {
        graphics.beginFill(0x0000FF, 0.5);
        graphics.drawRect(Math.random() * 200, Math.random() * 200, 200, 200);
        graphics.endFill();

        alpha = 0;
    }
}
}
