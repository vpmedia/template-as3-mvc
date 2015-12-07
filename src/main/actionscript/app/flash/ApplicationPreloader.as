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
import app.core.ApplicationConfig;

import com.greensock.TweenMax;

import flash.text.TextField;
import flash.text.TextFormat;

import hu.vpmedia.mvc.BaseView;
import hu.vpmedia.utils.TextFieldUtil;

/**
 * @inheritDoc
 */
public class ApplicationPreloader extends BaseView {

    /**
     * TBD
     */
    public var statusLabel:TextField;

    /**
     * TBD
     */
    public var percentLabel:TextField;

    /**
     * TBD
     */
    public function ApplicationPreloader() {
        super();
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * TBD
     */
    override protected function createChildren():void {
        var sWidth:Number;
        var sHeight:Number;
        if (!ApplicationConfig.STAGE_IS_FLUID || stage.stageWidth == 0 || stage.stageHeight == 0) {
            sWidth = ApplicationConfig.STAGE_WIDTH;
            sHeight = ApplicationConfig.STAGE_HEIGHT;
        }
        else {
            sWidth = stage.stageWidth;
            sHeight = stage.stageHeight;
        }

        var tf:TextFormat;

        tf = new TextFormat("Arial", 10, 0xFFFFFF, false, false, false, null, null, "center");
        statusLabel = TextFieldUtil.create("statusLabel", 0, 0, 800, 20, false, false, false, false, "left", tf);
        content.addChild(statusLabel);

        tf = new TextFormat("Arial", 16, 0xFFFFFF, false, false, false, null, null, "center");
        percentLabel = TextFieldUtil.create("percentLabel", 0, 20, 800, 30, false, false, false, false, "left", tf);
        content.addChild(percentLabel);

        setStatus("LOADING...");
        setProgress(-1);

        content.x = (sWidth >> 1) - (content.width >> 1);
        content.y = (sHeight >> 1) - (content.height >> 1);
    }

    //----------------------------------
    //  API
    //----------------------------------

    /**
     * TBD
     */
    public function setStatus(value:String):void {
        statusLabel.htmlText = "<font>" + value + "</font>";
    }

    /**
     * TBD
     */
    public function setProgress(percent:int):void {
        //trace(this, "setProgress", percent);

        if (percent < 0) {
            percentLabel.htmlText = "";
        }
        else {
            percentLabel.htmlText = percent + "%";
        }
    }

    /**
     * TBD
     */
    public function showCover():void {
        this.visible = true;
        setProgress(-1);
        setStatus("");
    }

    /**
     * TBD
     */
    public function show(time:Number = 0.6):void {
        //trace(this, "show");
        TweenMax.to(this, time, { autoAlpha: 1 });
    }

    /**
     * TBD
     */
    public function hide(time:Number = 0.4):void {
        //trace(this, "hide");
        TweenMax.to(this, time, { autoAlpha: 0 });
    }

    // EOC

}

// EOP

}
