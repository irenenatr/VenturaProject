"use strict";
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.FinanceController = void 0;
var common_1 = require("@nestjs/common");
var FinanceController = function () {
    var _classDecorators = [(0, common_1.Controller)('finance')];
    var _classDescriptor;
    var _classExtraInitializers = [];
    var _classThis;
    var _instanceExtraInitializers = [];
    var _addExpense_decorators;
    var _addBudget_decorators;
    var _getFinanceData_decorators;
    var FinanceController = _classThis = /** @class */ (function () {
        function FinanceController_1(financeService) {
            this.financeService = (__runInitializers(this, _instanceExtraInitializers), financeService);
        }
        FinanceController_1.prototype.addExpense = function (dto) {
            return this.financeService.addExpense(dto);
        };
        FinanceController_1.prototype.addBudget = function (dto) {
            return this.financeService.addBudget(dto);
        };
        FinanceController_1.prototype.getFinanceData = function () {
            return this.financeService.getAll();
        };
        return FinanceController_1;
    }());
    __setFunctionName(_classThis, "FinanceController");
    (function () {
        var _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(null) : void 0;
        _addExpense_decorators = [(0, common_1.Post)('expense')];
        _addBudget_decorators = [(0, common_1.Post)('budget')];
        _getFinanceData_decorators = [(0, common_1.Get)()];
        __esDecorate(_classThis, null, _addExpense_decorators, { kind: "method", name: "addExpense", static: false, private: false, access: { has: function (obj) { return "addExpense" in obj; }, get: function (obj) { return obj.addExpense; } }, metadata: _metadata }, null, _instanceExtraInitializers);
        __esDecorate(_classThis, null, _addBudget_decorators, { kind: "method", name: "addBudget", static: false, private: false, access: { has: function (obj) { return "addBudget" in obj; }, get: function (obj) { return obj.addBudget; } }, metadata: _metadata }, null, _instanceExtraInitializers);
        __esDecorate(_classThis, null, _getFinanceData_decorators, { kind: "method", name: "getFinanceData", static: false, private: false, access: { has: function (obj) { return "getFinanceData" in obj; }, get: function (obj) { return obj.getFinanceData; } }, metadata: _metadata }, null, _instanceExtraInitializers);
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        FinanceController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return FinanceController = _classThis;
}();
exports.FinanceController = FinanceController;
