#import "KIFastQRCaptureView.h"

@interface KIFastQRCaptureView ()

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) NSString *formerResult;

@end

@implementation KIFastQRCaptureView

- (id)init {
    self = [super init];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeCapture];
    }
    return self;
}

- (void)startCaptureWithDelegate:(id<KIFastQRCaptureDelegate>)delegate {
    [_session startRunning];
    _delegate = delegate;
    
}

- (void)stopCapture {
    [_session stopRunning];
    _session = nil;
    
    [_previewLayer removeFromSuperlayer];
}

# pragma mark - Private Methods

- (void)initializeCapture {
    AVCaptureSession *session = [self setupSession];
    if (!session) {return;}
    [self.layer addSublayer:[self setupPreviewLayer]];
    [self setupConnection];
}

- (AVCaptureSession *)setupSession {
    AVCaptureDeviceInput *input = [self setupInput];
    if (!input) {
        return nil;
    }
    
    _session = [AVCaptureSession new];
    [_session addInput:input];
    [self setupMetadataOutput];
    return _session;
}

- (AVCaptureDeviceInput *)setupInput {
    NSError *error;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    return [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
}

- (AVCaptureVideoPreviewLayer *)setupPreviewLayer {
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setFrame:self.bounds];
    return _previewLayer;
}

- (AVCaptureMetadataOutput *)setupMetadataOutput {
    AVCaptureMetadataOutput *output = [AVCaptureMetadataOutput new];
    // should call -addOutput before -setMetadataObjectTypes
    // @url http://www.ama-dev.com/iphone-qr-code-library-ios-7/
    [_session addOutput:output];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("KIFastQRCapture", NULL);
    [output setMetadataObjectsDelegate:self queue:dispatchQueue];

	NSLog(@"%@", [output availableMetadataObjectTypes]);
	[output setMetadataObjectTypes:@[
									 AVMetadataObjectTypeQRCode,		//QRコード
									 AVMetadataObjectTypeUPCECode,		//UPC-E
									 AVMetadataObjectTypeCode39Code,	//Code 39
									 AVMetadataObjectTypeCode39Mod43Code,//Code 39 mod 43
									 AVMetadataObjectTypeEAN13Code,		//EAN-13(JANコード標準タイプ)
									 AVMetadataObjectTypeEAN8Code,		//EAN-8(JANコード短縮タイプ)
									 AVMetadataObjectTypeCode93Code,	//Code 93
									 AVMetadataObjectTypeCode128Code,	//Code 128
									 AVMetadataObjectTypePDF417Code,	//PDF417
									 AVMetadataObjectTypeAztecCode		//Aztec code
									 //AVMetadataObjectTypeFace,			//(参考)人の顔
									 ]];

    return output;
}

- (AVCaptureConnection *)setupConnection {
    AVCaptureConnection *connection = _previewLayer.connection;
    connection.videoOrientation = AVCaptureVideoOrientationPortrait;
    return connection;
}

- (void)didGetQRCaptureResult:(NSString *)result {
    if ([_formerResult isEqualToString:result]) {
		return;
	} else {
		_formerResult = result;
		[_delegate fastQRView:self captureOutput:result];
	}
}

# pragma mark - AVCaptureMetadataOutputObjectsDelegate

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects != nil && [metadataObjects count] > 0 ) {
		NSString *str;
		for (AVMetadataMachineReadableCodeObject *meta in metadataObjects) {
			str = [NSString stringWithFormat: @"(%@)%@\n", [meta type], [meta stringValue]];
        }
		[self performSelectorOnMainThread:@selector(didGetQRCaptureResult:) withObject:str waitUntilDone:NO];
    }
}

@end
